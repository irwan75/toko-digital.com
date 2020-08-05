import 'package:flutter/material.dart';

class Data_barang {
  final String kode_kategori;
  final String nama_subkategori;
  final String kode_barang;
  final String nama_barang;
  final int stok_barang;
  final int harga_barang;
  final String ket_barang;
  final double berat_barang;
  final String satuan_barang;
  final String img_barang;
  final List<dynamic> list_img;

  Data_barang({
    this.kode_kategori,
    this.nama_subkategori,
    this.kode_barang,
    this.nama_barang,
    this.stok_barang,
    this.harga_barang,
    this.ket_barang,
    this.berat_barang,
    this.satuan_barang,
    this.img_barang,
    this.list_img,
  });
}

class BelanjaItemModel {
  final int id;
  int jumlah;
  int harga;
  final Data_barang databarang;

  BelanjaItemModel({this.id, this.jumlah, this.databarang, this.harga});
}
