import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController _googleMapController;
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor _customMarkerViewLocation;
  Location location = new Location();
  PermissionStatus _permissionGranted;

  List<Marker> markers = <Marker>[];

  String _mapStyle;
  bool _serviceEnabled;

  @override
  initState() {
    rootBundle.loadString('assets/style/map_night_style.txt').then((string) {
      _mapStyle = string;
    });

    getPermission();
    super.initState();
  }

  Future getPermission() async {
    _customMarkerViewLocation = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 2.5,
          size: Size(64, 64),
        ),
        'assets/images/bus-icon-red.png');

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    setState(() {
      markers.add(Marker(
          markerId: MarkerId('praiana-578'),
          position: LatLng(-26.9905955, -48.6288739),
          icon: _customMarkerViewLocation));
    });

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF3867D6),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController googleMapController) {
              _googleMapController = googleMapController;
              _googleMapController.setMapStyle(_mapStyle);
              _controller.complete(googleMapController);
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(-26.9905955, -48.6288739),
              zoom: 13.000,
            ),
            mapType: MapType.normal,
            myLocationEnabled: true,
            rotateGesturesEnabled: false,
            markers: markers.toSet(),
          )
        ],
      ),
    );
  }
}
