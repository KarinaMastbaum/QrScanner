import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    final CameraPosition puntoInicial = CameraPosition(
    target: scan.getLatLng(),
    zoom: 17.5,
    tilt: 50
  );

  //Marcadores
    Set<Marker> markers = new Set<Marker>();
      markers.add(new Marker(
        markerId: MarkerId('Geo-location'),
        position: scan.getLatLng()
        )
      );


    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon(Icons.my_location_rounded),
            onPressed: () async{
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: scan.getLatLng(),
                    zoom: 17.5,
                    tilt: 50
                  )
                )
              );
            }
          ),
        ],
      ),
      body:  GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        mapType: mapType,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: 
        FloatingActionButton(
          child: Icon(Icons.layers),
          onPressed: () {

            if(mapType == MapType.normal) {
              mapType = MapType.satellite;
            } else{
              mapType = MapType.normal;
            }
            setState(() {});
          },
        ),
    );
  }
}