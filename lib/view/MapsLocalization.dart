import 'dart:async';
import 'dart:typed_data';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:toko_digital/model/user_location.dart';
import 'package:toko_digital/view/belanja/provider/provider_google_maps.dart';

class MapsLocalisation extends StatefulWidget {
  @override
  _MapsLocalisationState createState() => _MapsLocalisationState();
}

class _MapsLocalisationState extends State<MapsLocalisation> {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  final Set<Marker> markers = {};
  final LatLng currentPosition = LatLng(-5.086029, 119.524294);
  Circle circle;
  GoogleMapController _controller;

  // Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-4.827963, 119.542124),
    zoom: 7,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context)
        .load("assets/images/marker_default.png");
    return byteData.buffer.asUint8List();
  }

  Future<Uint8List> getMarkerVendor() async {
    ByteData byteData = await DefaultAssetBundle.of(context)
        .load("assets/images/marker_toko_digital.png");
    return byteData.buffer.asUint8List();
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  void updateMarkerAndCircle(
      LocationData newLocalData, Uint8List imageData, Uint8List imageVendor) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      markers.add(Marker(
        markerId: MarkerId("yourLocation"),
        position: latlng,
        // rotation: newLocalData.heading,
        draggable: true,
        zIndex: 2,
        // flat: true,
        // anchor: Offset(0.5, 0.5),
        // icon: BitmapDescriptor.defaultMarker,
        icon: BitmapDescriptor.fromBytes(imageData),
        infoWindow: InfoWindow(
          snippet: "Klik Untuk Mengambil Lokasi ",
          title: "Apakah Lokasi Anda Disini ?",
          onTap: _handleTap(latlng),
        ),
      ));
      markers.add(marker = Marker(
        markerId: MarkerId("vendor"),
        position: currentPosition,
        // rotation: newLocalData.heading,
        draggable: false,
        zIndex: 2,
        infoWindow: InfoWindow(title: "Lokasi Toko-Digital.com Disini"),
        // flat: true,
        // anchor: Offset(0.5, 0.5),
        // icon: BitmapDescriptor.defaultMarker,
        icon: BitmapDescriptor.fromBytes(imageVendor),
      ));
      // marker = Marker(
      //   markerId: MarkerId("home"),
      //   position: latlng,
      //   // rotation: newLocalData.heading,
      //   draggable: true,
      //   zIndex: 2,
      //   // flat: true,
      //   // anchor: Offset(0.5, 0.5),
      //   // icon: BitmapDescriptor.defaultMarker,
      //   icon: BitmapDescriptor.fromBytes(imageData),
      // );
      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-4.815934, 119.547042),
      tilt: 59.440717697143555,
      zoom: 17.5);

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }

  // _getCurrentLocation() {
  //   final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  //   geolocator
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
  //       .then((Position position) {
  //     setState(() {
  //       _currentPosition = position;
  //     });
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      Uint8List imageVendor = await getMarkerVendor();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData, imageVendor);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged.listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              new CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(newLocalData.latitude, newLocalData.longitude),
                  tilt: 0,
                  zoom: 18.00)));
          updateMarkerAndCircle(newLocalData, imageData, imageVendor);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  _handleTap(LatLng point) {
    // print("Your Cordinat : " + point.toString());
    // Navigator.of(context).pop();
    // setState(() {
    // _markers.add(Marker(
    //   markerId: MarkerId(point.toString()),
    //   position: point,
    //   infoWindow: InfoWindow(
    //     title: 'I am a marker',
    //   ),
    //   icon:
    //       BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
    // ));
    // });
  }

  @override
  void initState() {
    // markers.add(
    //   Marker(
    //     markerId: MarkerId("-4.815934, 119.547042"),
    //     position: currentPosition,
    //     icon: BitmapDescriptor.
    //   ),
    // );
    super.initState();
  }

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
            // _controller.showMarkerInfoWindow(MarkerId("yourLocation"));
            // _controller.complete(controller);
          },
          markers: Set.of((markers != null) ? markers : []),
          // onCameraMove: ,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade600,
        // onPressed: _goToTheLake,
        onPressed: () {
          getCurrentLocation();
        },
        child: Icon(Icons.location_searching),
        // icon: Icon(Icons.location_searching),
      ),
    );
  }
}
