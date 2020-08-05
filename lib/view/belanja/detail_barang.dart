// import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:toko_digital/model/data_barang.dart';
import 'package:toko_digital/view/belanja/provider/belanja_provider.dart';
import 'package:toko_digital/controller/toast_handling.dart';

class DetailBarangBaru extends StatelessWidget {
  Data_barang db;
  DetailBarangBaru({this.db});

  List<String> url_image = [];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < db.list_img.length; i++) {
      url_image.add(db.list_img[i]['url_img']);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: Text(
          "Detail Barang",
          style: TextStyle(fontFamily: 'Comic'),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  initialPage: 0,
                  reverse: false,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: true,
                  pauseAutoPlayOnTouch: true,
                ),
                items: url_image.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 0.2,
                              blurRadius: 0.2,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            i,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      db.nama_barang,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Comic',
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        db.nama_subkategori,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Comic',
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Rp." + db.harga_barang.toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Comic',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 25),
                    // Text(db.list_img[0]['url_img']),
                    // Text(url_image.length.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Berat Barang : ",
                          style: TextStyle(fontFamily: 'Comic', fontSize: 15),
                        ),
                        Text(
                          db.berat_barang.toString() + " " + db.satuan_barang,
                          style: TextStyle(
                            fontFamily: 'Comic',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.green.shade600,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Keterangan Barang",
                        style: TextStyle(
                          color: Colors.green.shade600,
                          fontFamily: 'Comic',
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(db.ket_barang),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: FlatButton(
          onPressed: () {
            Provider.of<BelanjaProvider>(context, listen: false)
                .AddListBelanja(listbelanja: db);
            toastClickButton("Berhasil Ditambahkan");
          },
          child: Text(
            "Masukkan keranjang",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Comic',
              fontSize: 17,
            ),
          ),
          color: Colors.green[600],
        ),
      ),
    );
  }
}
