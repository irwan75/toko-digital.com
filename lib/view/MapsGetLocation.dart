import 'dart:async';
import 'dart:typed_data';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_platform_interface/location_platform_interface.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:toko_digital/model/user_location.dart';
import 'package:toko_digital/view/belanja/provider/provider_google_maps.dart';

class MapsGetLocation extends StatefulWidget {
  @override
  _MapsGetLocationState createState() => _MapsGetLocationState();
}

class _MapsGetLocationState extends State<MapsGetLocation> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Set<Marker> markers = {};
  final LatLng locationVendor = LatLng(-5.086029, 119.524294);
  GoogleMapController _controller;
  final String latitude = "";
  final String longitude = "";

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-4.827963, 119.542124),
    zoom: 7,
  );

  Future<void> _goToTheLake(double latitude, double longitude) async {
    final GoogleMapController controller = await _controller;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 192.8334901395799,
          tilt: 59.440717697143555,
          zoom: 17.5,
          target: LatLng(latitude, longitude),
        ),
      ),
    );
  }

  _getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> p =
          await geolocator.placemarkFromCoordinates(latitude, longitude);

      Placemark place = p[0];
      print(
          place.locality + " -- " + place.postalCode + " -- " + place.country);
      // setState(() {
      //   _currentAddress =
      //       "${place.locality}, ${place.postalCode}, ${place.country}";
      // });
    } catch (e) {
      print(e);
    }
  }

  _getCurrentLocation() async {
    final position = await Geolocator().getCurrentPosition();
    _goToTheLake(position.latitude, position.longitude);

    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId("user_location"),
          position: LatLng(position.latitude, position.longitude),
          icon: BitmapDescriptor.defaultMarker,
          draggable: true,
          infoWindow: InfoWindow(
              title: "Apakah Lokasi Anda Disini ? ",
              snippet: "Klik Teks Ini Mengambil Lokasi",
              onTap: () {
                _getAddressFromLatLng(position.latitude, position.longitude);
              }),
        ),
      );
    });
  }

  @override
  void initState() {
    markers.add(
      Marker(
        markerId: MarkerId("vendor_location"),
        position: locationVendor,
        icon: BitmapDescriptor.defaultMarker,
        draggable: false,
        infoWindow: InfoWindow(
            title: "Lokasi Tempat toko-digital.com",
            onTap: () {
              print("Okee Mantapp");
            }),
      ),
    );
    super.initState();
    print(latitude);
  }

  void _updatePosition(CameraPosition _position) {
    // markers.remove(markers);
    // Marker marker = markers.firstWhere((p) => p.markerId == MarkerId('kode1'),
    //     orElse: () => null);

    markers.add(
      Marker(
        markerId: MarkerId('user_location'),
        position: LatLng(_position.target.latitude, _position.target.longitude),
        draggable: true,
        infoWindow: InfoWindow(
          title: "Apakah Lokasi Anda Disini ? ",
          snippet: "Klik Teks Ini Mengambil Lokasi",
          onTap: () {
            print("Info Window");
          },
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    setState(() {});
  }

  void tampil() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: Text(
          "Pilih Alamat Anda",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Comic',
          ),
        ),
      ),
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          onCameraMove: (latitude == null)
              ? []
              : ((_position) => _updatePosition(_position)),
          markers: Set.of((markers != null) ? markers : []),
          // onCameraMove: ,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade600,
        onPressed: () {
          _getCurrentLocation();
        },
        child: Icon(Icons.location_searching),
      ),
    );
  }
}
