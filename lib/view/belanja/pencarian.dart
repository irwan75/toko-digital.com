import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toko_digital/model/data_barang.dart';
import 'package:http/http.dart' as http;
import 'package:toko_digital/view/belanja/detail_barang.dart';

class Pencarian extends StatefulWidget {
  @override
  _PencarianState createState() => _PencarianState();
}

class _PencarianState extends State<Pencarian> {
  List<Data_barang> listBarang = List<Data_barang>();
  List<Data_barang> listSementaraBarang = List<Data_barang>();

  Future<void> getData() async {
    final response =
        await http.get("https://angkutapps.com/toko-digital/read_barang.php");
    if (response.statusCode == 200) {
      final myData = jsonDecode(response.body);

      myData.forEach((api) {
        final dataTemp = Data_barang(
            berat_barang: double.parse(api['berat_barang']),
            harga_barang: int.parse(api['harga_barang']),
            ket_barang: api['ket_barang'],
            kode_barang: api['kode_barang'],
            kode_kategori: api['kode_kategori'],
            nama_barang: api['nama_barang'],
            nama_subkategori: api['nama_subkategori'],
            satuan_barang: api['satuan_barang'],
            stok_barang: int.parse(api['stok_barang']));

        setState(() {
          listBarang.add(dataTemp);
        });
      });
    }
  }

  void searchData({String kata}) {
    var _listSementaraBarang = List<Data_barang>();
    setState(() {
      _listSementaraBarang = listBarang;
    });

    if (kata.isNotEmpty) {
      var databaru = List<Data_barang>();
      _listSementaraBarang.forEach((element) {
        if (element.nama_barang.toLowerCase().contains(kata)) {
          databaru.add(element);

          setState(() {
            listSementaraBarang.clear();
            listSementaraBarang.addAll(databaru);
          });
        }
      });
      return;
    } else {
      setState(() {
        listSementaraBarang.clear();
        // listSementaraBarang.addAll(listBarang);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: Form(
          child: TextFormField(
            decoration: InputDecoration(hintText: "Masukkan Pencarian"),
            onChanged: (e) {
              searchData(kata: e);
            },
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => DetailBarangBaru(
                        db: listSementaraBarang[index],
                      )));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green[600],
                ),
                title: Text(
                  listSementaraBarang[index].nama_barang,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Comic',
                  ),
                ),
                subtitle: Text(
                  "Rp. " + listSementaraBarang[index].harga_barang.toString(),
                  style: TextStyle(
                      fontFamily: 'Comic', fontWeight: FontWeight.normal),
                ),
              ),
            ),
          );
        },
        itemCount: listSementaraBarang.length,
      ),
    );
  }
}
