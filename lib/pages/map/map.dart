import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:wheres_my_bus/private/env.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapboxMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          MapboxMap(
            accessToken: MAPBOX_TOKEN,
            styleString: MAPBOX_STYLE,
            initialCameraPosition: CameraPosition(
              zoom: 15.0,
              target: LatLng(14.508, 46.048),
            ),
            onMapCreated: (MapboxMapController controller) {
              setState(() {
                mapController = controller;
              });
            },
          ),
        ],
      ),
    );
  }
}
