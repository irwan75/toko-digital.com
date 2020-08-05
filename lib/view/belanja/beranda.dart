import 'dart:convert';
// import 'dart:html';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_digital/view/belanja/informasi_toko.dart';
import 'package:toko_digital/view/belanja/keranjang.dart';
import 'package:toko_digital/view/belanja/tab_bar/listBahanKue.dart';
import 'package:toko_digital/view/belanja/tab_bar/listBahanPokok.dart';
import 'package:toko_digital/view/belanja/tab_bar/listBumbuMasak.dart';
import 'package:toko_digital/view/belanja/tab_bar/listIbudanAnak.dart';
import 'package:toko_digital/view/belanja/tab_bar/listKesehatan.dart';
import 'package:toko_digital/view/belanja/tab_bar/listMakanan.dart';
import 'package:toko_digital/view/belanja/tab_bar/listMinuman.dart';
import 'package:toko_digital/view/belanja/tab_bar/listPerawatanTubuh.dart';
import 'package:toko_digital/view/belanja/tab_bar/listProdukOlahan.dart';
import 'package:toko_digital/view/belanja/tab_bar/listRumahTangga.dart';
import 'package:toko_digital/view/belanja/tab_bar/list_all.dart';
import 'package:toko_digital/view/belanja/pencarian.dart';
import 'package:toko_digital/view/belanja/provider/belanja_provider.dart';

import '../../model/data_barang.dart';
import '../../model/data_barang.dart';
import '../../model/data_barang.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, initialIndex: 0, length: 11);
    getData();
  }

  Future<void> getData() async {
    final response =
        await http.get("https://angkutapps.com/toko-digital/read_barang.php");
    if (response.statusCode == 200) {
      final myData = jsonDecode(response.body);

      myData.forEach((api) {
        if (api['kode_kategori'] == "K0000001") {
          final dataTemp = Data_barang(
              berat_barang: double.parse(api['berat_barang']),
              harga_barang: int.parse(api['harga_barang']),
              ket_barang: api['ket_barang'],
              kode_barang: api['kode_barang'],
              kode_kategori: api['kode_kategori'],
              list_img: api['img_detail_barang'],
              nama_barang: api['nama_barang'],
              nama_subkategori: api['nama_subkategori'],
              satuan_barang: api['satuan_barang'],
              img_barang: api['img_barang'],
              stok_barang: int.parse(
                api['stok_barang'],
              ));
          setState(() {
            subKategoriBahanPokok.add(dataTemp);
            bahanPokok.add(dataTemp.nama_subkategori);
            // print(dataTemp.list_img);
          });
        } else if (api['kode_kategori'] == "K0000002") {
          final dataTemp = Data_barang(
              berat_barang: double.parse(api['berat_barang']),
              harga_barang: int.parse(api['harga_barang']),
              ket_barang: api['ket_barang'],
              kode_barang: api['kode_barang'],
              kode_kategori: api['kode_kategori'],
              list_img: api['img_detail_barang'],
              img_barang: api['img_barang'],
              nama_barang: api['nama_barang'],
              nama_subkategori: api['nama_subkategori'],
              satuan_barang: api['satuan_barang'],
              stok_barang: int.parse(api['stok_barang']));
          setState(() {
            subKategoriBumbuMasak.add(dataTemp);
            bumbuMasak.add(dataTemp.nama_subkategori);
          });
        } else if (api['kode_kategori'] == "K0000003") {
          final dataTemp = Data_barang(
              berat_barang: double.parse(api['berat_barang']),
              harga_barang: int.parse(api['harga_barang']),
              ket_barang: api['ket_barang'],
              kode_barang: api['kode_barang'],
              kode_kategori: api['kode_kategori'],
              list_img: api['img_detail_barang'],
              img_barang: api['img_barang'],
              nama_barang: api['nama_barang'],
              nama_subkategori: api['nama_subkategori'],
              satuan_barang: api['satuan_barang'],
              stok_barang: int.parse(api['stok_barang']));
          setState(() {
            subKategoriBahanKue.add(dataTemp);
            bahanKue.add(dataTemp.nama_subkategori);
          });
        } else if (api['kode_kategori'] == "K0000004") {
          final dataTemp = Data_barang(
              berat_barang: double.parse(api['berat_barang']),
              harga_barang: int.parse(api['harga_barang']),
              ket_barang: api['ket_barang'],
              kode_barang: api['kode_barang'],
              kode_kategori: api['kode_kategori'],
              list_img: api['img_detail_barang'],
              img_barang: api['img_barang'],
              nama_barang: api['nama_barang'],
              nama_subkategori: api['nama_subkategori'],
              satuan_barang: api['satuan_barang'],
              stok_barang: int.parse(api['stok_barang']));
          setState(() {
            subKategoriProdukOlahan.add(dataTemp);
            produkOlahan.add(dataTemp.nama_subkategori);
            // print("face " + dataTemp.nama_barang);
          });
        } else if (api['kode_kategori'] == "K0000005") {
          final dataTemp = Data_barang(
              berat_barang: double.parse(api['berat_barang']),
              harga_barang: int.parse(api['harga_barang']),
              ket_barang: api['ket_barang'],
              kode_barang: api['kode_barang'],
              kode_kategori: api['kode_kategori'],
              list_img: api['img_detail_barang'],
              img_barang: api['img_barang'],
              nama_barang: api['nama_barang'],
              nama_subkategori: api['nama_subkategori'],
              satuan_barang: api['satuan_barang'],
              stok_barang: int.parse(api['stok_barang']));
          setState(() {
            subKategoriRumahTangga.add(dataTemp);
            rumahTangga.add(dataTemp.nama_subkategori);
          });
        } else if (api['kode_kategori'] == "K0000006") {
          final dataTemp = Data_barang(
              berat_barang: double.parse(api['berat_barang']),
              harga_barang: int.parse(api['harga_barang']),
              ket_barang: api['ket_barang'],
              kode_barang: api['kode_barang'],
              kode_kategori: api['kode_kategori'],
              list_img: api['img_detail_barang'],
              img_barang: api['img_barang'],
              nama_barang: api['nama_barang'],
              nama_subkategori: api['nama_subkategori'],
              satuan_barang: api['satuan_barang'],
              stok_barang: int.parse(api['stok_barang']));
          setState(() {
            subKategoriMakanan.add(dataTemp);
            makanan.add(dataTemp.nama_subkategori);
          });
        } else if (api['kode_kategori'] == "K0000007") {
          final dataTemp = Data_barang(
              berat_barang: double.parse(api['berat_barang']),
              harga_barang: int.parse(api['harga_barang']),
              ket_barang: api['ket_barang'],
              kode_barang: api['kode_barang'],
              kode_kategori: api['kode_kategori'],
              list_img: api['img_detail_barang'],
              nama_barang: api['nama_barang'],
              nama_subkategori: api['nama_subkategori'],
              img_barang: api['img_barang'],
              satuan_barang: api['satuan_barang'],
              stok_barang: int.parse(api['stok_barang']));
          setState(() {
            subKategoriMinuman.add(dataTemp);
            minuman.add(dataTemp.nama_subkategori);
          });
        } else if (api['kode_kategori'] == "K0000008") {
          final dataTemp = Data_barang(
              berat_barang: double.parse(api['berat_barang']),
              harga_barang: int.parse(api['harga_barang']),
              ket_barang: api['ket_barang'],
              kode_barang: api['kode_barang'],
              kode_kategori: api['kode_kategori'],
              list_img: api['img_detail_barang'],
              nama_barang: api['nama_barang'],
              nama_subkategori: api['nama_subkategori'],
              img_barang: api['img_barang'],
              satuan_barang: api['satuan_barang'],
              stok_barang: int.parse(api['stok_barang']));
          setState(() {
            subKategoriIbudanAnak.add(dataTemp);
            ibudanAnak.add(dataTemp.nama_subkategori);
          });
        } else if (api['kode_kategori'] == "K0000009") {
          final dataTemp = Data_barang(
              berat_barang: double.parse(api['berat_barang']),
              harga_barang: int.parse(api['harga_barang']),
              ket_barang: api['ket_barang'],
              kode_barang: api['kode_barang'],
              kode_kategori: api['kode_kategori'],
              list_img: api['img_detail_barang'],
              nama_barang: api['nama_barang'],
              nama_subkategori: api['nama_subkategori'],
              img_barang: api['img_barang'],
              satuan_barang: api['satuan_barang'],
              stok_barang: int.parse(api['stok_barang']));
          setState(() {
            subKategoriKesehatan.add(dataTemp);
            kesehatan.add(dataTemp.nama_subkategori);
          });
        } else if (api['kode_kategori'] == "K0000010") {
          final dataTemp = Data_barang(
              berat_barang: double.parse(api['berat_barang']),
              harga_barang: int.parse(api['harga_barang']),
              ket_barang: api['ket_barang'],
              kode_barang: api['kode_barang'],
              list_img: api['img_detail_barang'],
              kode_kategori: api['kode_kategori'],
              img_barang: api['img_barang'],
              nama_barang: api['nama_barang'],
              nama_subkategori: api['nama_subkategori'],
              satuan_barang: api['satuan_barang'],
              stok_barang: int.parse(api['stok_barang']));
          setState(() {
            subKategoriPerawatanTubuh.add(dataTemp);
            perawatanTubuh.add(dataTemp.nama_subkategori);
          });
        }
      });
    }
  }

  List<String> tabName = [
    "All",
    "Bahan Pokok",
    "Bumbu Masak",
    "Bahan Kue",
    "Produk Olahan",
    "Rumah Tangga",
    "Makanan",
    "Minuman",
    "Ibu dan Anak",
    "Kesehatan",
    "Perawatan Tubuh"
  ];

  List<Data_barang> subKategoriBahanPokok = List<Data_barang>();
  List<String> bahanPokok = List<String>();
  List<Data_barang> subKategoriBumbuMasak = List<Data_barang>();
  List<String> bumbuMasak = List<String>();
  List<Data_barang> subKategoriBahanKue = List<Data_barang>();
  List<String> bahanKue = List<String>();
  List<Data_barang> subKategoriProdukOlahan = List<Data_barang>();
  List<String> produkOlahan = List<String>();
  List<Data_barang> subKategoriRumahTangga = List<Data_barang>();
  List<String> rumahTangga = List<String>();
  List<Data_barang> subKategoriMakanan = List<Data_barang>();
  List<String> makanan = List<String>();
  List<Data_barang> subKategoriMinuman = List<Data_barang>();
  List<String> minuman = List<String>();
  List<Data_barang> subKategoriIbudanAnak = List<Data_barang>();
  List<String> ibudanAnak = List<String>();
  List<Data_barang> subKategoriKesehatan = List<Data_barang>();
  List<String> kesehatan = List<String>();
  List<Data_barang> subKategoriPerawatanTubuh = List<Data_barang>();
  List<String> perawatanTubuh = List<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Pencarian()));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * .8,
            height: 40,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              "Cari Barang",
              style: TextStyle(fontSize: 14, fontFamily: 'Comic'),
            ),
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => InformasiToko()));
            },
            child: Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          )
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: tabName
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
          controller: _controller,
          isScrollable: true,
        ),
      ),
      body: TabBarView(controller: _controller, children: [
        ListAll(
          bahanPokokSub: bahanPokok,
          bahanPokok: subKategoriBahanPokok,
          bumbuMasak: subKategoriBumbuMasak,
          bahanKue: subKategoriBahanKue,
          produkOlahan: subKategoriProdukOlahan,
          rumahTangga: subKategoriRumahTangga,
          makanan: subKategoriMakanan,
          minuman: subKategoriMinuman,
          ibuanak: subKategoriIbudanAnak,
          kesehatan: subKategoriKesehatan,
          bumbuMasakSub: bumbuMasak,
          pertubuh: subKategoriPerawatanTubuh,
          bahankueSub: bahanKue,
          ibuanakSub: ibudanAnak,
          kesehatanSub: kesehatan,
          makananSub: makanan,
          minumanSub: minuman,
          pertubuhSub: perawatanTubuh,
          produkOlahanSub: produkOlahan,
          rumahTanggaSub: rumahTangga,
        ),
        ListBahanPokok(
          bahanPokok: subKategoriBahanPokok,
          bahanPokokSub: bahanPokok,
        ),
        ListBumbuMasak(
          bumbuMasak: subKategoriBumbuMasak,
          bumbuMasakSub: bumbuMasak,
        ),
        ListBahanKue(
          bahanKue: subKategoriBahanKue,
          bahanKueSub: bahanKue,
        ),
        ListProdukOlahan(
          produkOlahan: subKategoriProdukOlahan,
          produkOlahanSub: produkOlahan,
        ),
        ListRumahTangga(
          rumahTangga: subKategoriRumahTangga,
          rumahTanggaSub: rumahTangga,
        ),
        ListMakanan(
          makanan: subKategoriMakanan,
          makananSub: makanan,
        ),
        ListMinuman(
          minuman: subKategoriMinuman,
          minumanSub: minuman,
        ),
        ListIbudanAnak(
          ibudanAnak: subKategoriIbudanAnak,
          ibudanAnakSub: ibudanAnak,
        ),
        ListKesehatan(
          kesehatan: subKategoriKesehatan,
          kesehatanSub: kesehatan,
        ),
        ListPerawatanTubuh(
          perawatanTubuh: subKategoriPerawatanTubuh,
          perawatanTubuhSub: perawatanTubuh,
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Material(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Keranjang()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(70),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 0.1,
                  color: Colors.black38,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Total Harga : ",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comic',
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      "Rp. " +
                          Provider.of<BelanjaProvider>(
                            context,
                          ).hargaTotal.toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Comic',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade600,
                  ),
                  child: Text(
                    Provider.of<BelanjaProvider>(context)
                        .listBelanja
                        .length
                        .toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Comic',
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
