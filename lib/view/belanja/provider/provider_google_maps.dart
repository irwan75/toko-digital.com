import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:toko_digital/model/user_location.dart';

class GoogleMapsController with ChangeNotifier {
  GoogleMapController _controller;
  final Set<Marker> markers = {};

  static final CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(-4.815934, 119.547042),
    tilt: 59.440717697143555,
    zoom: 17.5,
  );

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  _getCurrentLocation() async {
    final position = await Geolocator().getCurrentPosition();
    markers.add(
      Marker(
        markerId: MarkerId("vendor_location"),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarker,
        draggable: false,
        infoWindow: InfoWindow(
            title: "Apakah Lokasi Anda Disini ? ",
            snippet: "Klik Teks Ini Mengambil Lokasi",
            onTap: () {
              print("Okee Mantapp");
            }),
      ),
    );

    _goToTheLake();
  }
}
