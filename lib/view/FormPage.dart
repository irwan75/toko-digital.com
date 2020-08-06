import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toko_digital/view/splash_screen.dart';
import 'MapsGetLocation.dart';
import 'MapsLocalization.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController controllerNamaPenerima = new TextEditingController();
  TextEditingController controllerNamaTempat = new TextEditingController();
  TextEditingController controllerAlamatTempat = new TextEditingController();
  TextEditingController controllerPengantaran = new TextEditingController();
  TextEditingController controllerNomorTelepon = new TextEditingController();
  TextEditingController controllerNomorWA = new TextEditingController();

  // void insertData() {
  //   var url = "http://35.198.233.181/toko-digital/insert.php";

  //   try {
  //     http.post(url, body: {
  //       "nama": controllerNamaPenerima.text,
  //       "alamat": controllerAlamatTempat.text,
  //       "pekerjaan": controllerNamaTempat.text
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void onPressed(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Apakah Data Anda Sudah Benar ?"),
      actions: <Widget>[
        RaisedButton(
          color: Colors.green.shade600,
          child: Text("Belum"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        RaisedButton(
          color: Colors.green.shade600,
          child: Text("Ya"),
          onPressed: () {
            // insertData();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return SplashScreen(s: "notification_intro");
            }));
            // User.connectToAPI("4").then((value) {
            //   users = value;
            //   setState(() {});
            // });
          },
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: Text(
          "Form Pengiriman",
          style: TextStyle(fontFamily: 'Comic'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              TextField(
                style: TextStyle(fontFamily: 'Comic'),
                controller: controllerNamaPenerima,
                maxLines: null,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                  hintText: "Masukkan Nama Penerima",
                  labelText: "Nama Penerima",
                  border: OutlineInputBorder(),
                  icon: Icon(
                    Icons.person,
                    color: Colors.green.shade600,
                    size: 32,
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 15),
              TextField(
                style: TextStyle(fontFamily: 'Comic'),
                controller: controllerNamaTempat,
                maxLines: null,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                  hintText: "Masukkan Nama Toko/Rumah/Cafe/Warkop",
                  labelText: "Nama Tempat",
                  border: OutlineInputBorder(),
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.green.shade600,
                    size: 32,
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  new Flexible(
                    child: TextField(
                      style: TextStyle(
                        fontFamily: 'Comic',
                      ),
                      maxLines: null,
                      controller: controllerAlamatTempat,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                        hintText:
                            "Masukkan Alamat Lengkap Toko/Rumah/Cafe/Warkop",
                        labelText: "Alamat Tempat",
                        border: OutlineInputBorder(),
                        icon: Icon(
                          Icons.map,
                          color: Colors.green.shade600,
                          size: 32,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.place,
                      color: Colors.green.shade600,
                      size: 32,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return MapsGetLocation();
                      }));
                    },
                  ),
                ],
              ),
              SizedBox(height: 15),
              TextField(
                style: TextStyle(fontFamily: 'Comic'),
                controller: controllerPengantaran,
                maxLines: null,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  hintText: "Pengantaran Sekarang/Dijadwal",
                  labelText: "Pengantaran",
                  border: OutlineInputBorder(),
                  icon: Icon(
                    Icons.local_taxi,
                    color: Colors.green.shade600,
                    size: 32,
                  ),
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 15),
              TextField(
                maxLines: null,
                style: TextStyle(fontFamily: 'Comic'),
                controller: controllerNomorTelepon,
                decoration: InputDecoration(
                  hintText: "Masukkan Nomor Telepon",
                  labelText: "Nomor Telepon",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  border: OutlineInputBorder(),
                  icon: Icon(
                    Icons.call,
                    color: Colors.green.shade600,
                    size: 32,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              TextField(
                maxLines: null,
                style: TextStyle(fontFamily: 'Comic'),
                controller: controllerNomorWA,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                  hintText: "Masukkan Nomor WhatsApp",
                  labelText: "Nomor WhatsApp",
                  border: OutlineInputBorder(),
                  icon: Icon(
                    Icons.phone_android,
                    color: Colors.green.shade600,
                    size: 32,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  onPressed(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green.shade600,
                  ),
                  child: Center(
                    child: Text(
                      "Selesai Belanja",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Comic',
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
