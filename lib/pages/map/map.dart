import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  SharedPreferences _sharedPreferences;

  Geolocator _geolocator = Geolocator()..forceAndroidLocationManager;
  GoogleMapController _googleMapController;
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor _customMarkerViewLocation;

  List<Polyline> polyline = <Polyline>[];

  List<Marker> markers = <Marker>[];

  String _mapStyle, lat, lng;

  @override
  initState() {
    _geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    rootBundle.loadString('assets/style/map_night_style.txt').then((string) {
      _mapStyle = string;
    });

    getData();

    super.initState();
  }

  void getData() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    if (_sharedPreferences.getBool('itjbcu') != null ||
        _sharedPreferences.getBool('itjbcu')) {
      await createRouteLine('praiana-itj-cbu-365-1', Color(0XFFF7B731));
    }

    if (_sharedPreferences.getBool('bondindinho') != null ||
        _sharedPreferences.getBool('bondindinho')) {
      await createRouteLine('expressosul_bondindinho', Colors.blue);
    }

    _customMarkerViewLocation = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 2.5,
          size: Size(64, 64),
        ),
        'assets/images/bus-icon-red.png');

    _firebaseDatabase
        .reference()
        .child('realtime_locations')
        .onChildChanged
        .listen((snapshot) {
      if (snapshot.snapshot.value.isNotEmpty) {
        lat = snapshot.snapshot.value['lat'].toString();
        lng = snapshot.snapshot.value['lng'].toString();

        setState(() {
          markers.add(Marker(
              markerId:
                  MarkerId(snapshot.snapshot.value['driver_id'].toString()),
              position: LatLng(double.parse(lat), double.parse(lng)),
              icon: _customMarkerViewLocation));
        });
      }
    });
  }

  Future createRouteLine(asset, color) async {
    List<LatLng> latLgnList = <LatLng>[];

    var data = rootBundle.loadString('assets/data/$asset.json');
    var json = jsonDecode(await data);

    json['geometry']['coordinates'].forEach((element) {
      var longitude = element
          .toString()
          .split(' ')[0]
          .replaceAll('[', '')
          .replaceAll(',', '');
      var latitude = element.toString().split(' ')[1].replaceAll(']', '');

      latLgnList.add(LatLng(double.parse(latitude), double.parse(longitude)));
    });

    setState(() {
      polyline.add(Polyline(
        polylineId: PolylineId(asset),
        width: 3,
        points: latLgnList,
        color: color,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Mapa',
          style: TextStyle(
            color: Color(0XFFF7B731),
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.popAndPushNamed(context, '/map_options'),
          ),
        ],
        backgroundColor: Color(0XFF3867D6),
      ),
      body: Stack(
        children: [
          map(),
        ],
      ),
    );
  }

  Widget map() {
    return GoogleMap(
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
      polylines: polyline.toSet(),
    );
  }
}
