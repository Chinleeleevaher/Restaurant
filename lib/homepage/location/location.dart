import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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

  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(17.976928, 102.626712);
  static const LatLng destination = LatLng(17.980687, 102.630596);
//----of location-----------------
  Future<Position> getcurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error" + error.toString());
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
              CameraPosition(target: destination, zoom: 14.5),
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
                  child: Icon(Icons.map),
                )),
          ],
        ));
  }
}
