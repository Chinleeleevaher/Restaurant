// ignore_for_file: library_prefixes

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart' as google_Map;

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
//----map launcher------------

  static const LatLng destination = LatLng(17.980687, 102.630596);
//----of location-----------------
  Future<Position> getcurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
     
    });
    return await Geolocator.getCurrentPosition();
  }

  Future<void> gotoGoogleMape() async {
    await google_Map.MapLauncher.showMarker(
        mapType: google_Map.MapType.google,
        coords: google_Map.Coords(17.980687, 102.630596),
        title: "Home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.hybrid,
          trafficEnabled: true,
          initialCameraPosition:
              const CameraPosition(target: destination, zoom: 14.5),
          markers: {
            // const Marker(markerId: MarkerId("source"), position: sourceLocation),
            const Marker(
                markerId: MarkerId("Destination"), position: destination),
          },
        ),
        floatingActionButton: Stack(
          children: [
            Positioned(
                bottom: 20,
                left: 20,
                child: FloatingActionButton(
                  onPressed: () {
                    getcurrentLocation().then((value) => gotoGoogleMape());
                  },
                  child: const Icon(Icons.map),
                )),
          ],
        ));
  }
}
