import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_digital/data.dart';
import 'package:toko_digital/view/belanja/detail_barang.dart';
import 'package:toko_digital/view/belanja/provider/belanja_provider.dart';
import 'package:toko_digital/controller/toast_handling.dart';

import '../../../model/data_barang.dart';
import '../../../model/data_barang.dart';
import '../../../model/data_barang.dart';
import '../../../model/data_barang.dart';
import '../../../model/data_barang.dart';
import '../../../model/data_barang.dart';
import '../../../model/data_barang.dart';
import '../provider/belanja_provider.dart';

class ListAll extends StatefulWidget {
  final List<Data_barang> bahanPokok;
  final List<String> bahanPokokSub;
  final List<String> bumbuMasakSub;
  final List<String> bahankueSub;
  final List<String> produkOlahanSub;
  final List<String> rumahTanggaSub;
  final List<String> makananSub;
  final List<String> minumanSub;
  final List<String> ibuanakSub;
  final List<String> kesehatanSub;
  final List<String> pertubuhSub;
  final List<Data_barang> bumbuMasak;
  final List<Data_barang> bahanKue;
  final List<Data_barang> produkOlahan;
  final List<Data_barang> rumahTangga;
  final List<Data_barang> makanan;
  final List<Data_barang> minuman;
  final List<Data_barang> ibuanak;
  final List<Data_barang> kesehatan;
  final List<Data_barang> pertubuh;

  ListAll(
      {this.bahanPokok,
      this.bumbuMasak,
      this.bahanKue,
      this.produkOlahan,
      this.rumahTangga,
      this.makanan,
      this.minuman,
      this.ibuanak,
      this.kesehatan,
      this.bahanPokokSub,
      this.pertubuh,
      this.bumbuMasakSub,
      this.bahankueSub,
      this.ibuanakSub,
      this.kesehatanSub,
      this.makananSub,
      this.minumanSub,
      this.pertubuhSub,
      this.produkOlahanSub,
      this.rumahTanggaSub,});

  @override
  _ListAllState createState() => _ListAllState(
      bahanKue: bahanKue,
      bahanPokok: bahanPokok,
      bahanPokokSub: bahanPokokSub,
      bahankueSub: bahankueSub,
      bumbuMasak: bumbuMasak,
      bumbuMasakSub: bumbuMasakSub,
      ibuanak: ibuanak,
      ibuanakSub: ibuanakSub,
      kesehatan: kesehatan,
      kesehatanSub: kesehatanSub,
      makanan: makanan,
      makananSub: makananSub,
      minuman: minuman,
      minumanSub: minumanSub,
      pertubuh: pertubuh,
      pertubuhSub: pertubuhSub,
      produkOlahan: produkOlahan,
      produkOlahanSub: produkOlahanSub,
      rumahTangga: rumahTangga,
      rumahTanggaSub: rumahTanggaSub);
}

class _ListAllState extends State<ListAll> {

  final List<Data_barang> bahanPokok;
  final List<String> bahanPokokSub;
  final List<String> bumbuMasakSub;
  final List<String> bahankueSub;
  final List<String> produkOlahanSub;
  final List<String> rumahTanggaSub;
  final List<String> makananSub;
  final List<String> minumanSub;
  final List<String> ibuanakSub;
  final List<String> kesehatanSub;
  final List<String> pertubuhSub;
  final List<Data_barang> bumbuMasak;
  final List<Data_barang> bahanKue;
  final List<Data_barang> produkOlahan;
  final List<Data_barang> rumahTangga;
  final List<Data_barang> makanan;
  final List<Data_barang> minuman;
  final List<Data_barang> ibuanak;
  final List<Data_barang> kesehatan;
  final List<Data_barang> pertubuh;
  _ListAllState(
      {this.bumbuMasakSub,
      this.bahanKue,
      this.bahanPokok,
      this.bahanPokokSub,
      this.bahankueSub,
      this.bumbuMasak,
      this.ibuanak,
      this.ibuanakSub,
      this.kesehatan,
      this.kesehatanSub,
      this.makanan,
      this.makananSub,
      this.minuman,
      this.minumanSub,
      this.pertubuh,
      this.pertubuhSub,
      this.produkOlahan,
      this.produkOlahanSub,
      this.rumahTangga,
      this.rumahTanggaSub,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        controller: Provider.of<BelanjaProvider>(context, listen: false).controller,
        child: Column(
          children: <Widget>[
            widget.bahanPokok.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      "Bahan Pokok",
                      style: TextStyle(
                          fontFamily: 'Comic',
                          color: Colors.white,
                          fontSize: 17),
                    )),
                  )
                : Container(
                    margin: EdgeInsets.all(10),
                    child: CircularProgressIndicator(),
                  ),
            Column(
                children: List.generate(
                    widget.bahanPokokSub.length > 1
                        ? widget.bahanPokokSub.length - 1
                        : 0, (index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        widget.bahanPokokSub[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Wrap(
                      children: createItemss(
                          widget.bahanPokokSub[index], widget.bahanPokok),
                    ),
                  ],
                ),
              );
            })),
            widget.bumbuMasak.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      "Bumbu Masak",
                      style: TextStyle(
                          fontFamily: 'Comic',
                          color: Colors.white,
                          fontSize: 17),
                    )),
                  )
                : Container(),
            Column(
                children: List.generate(
                    widget.bumbuMasakSub.length > 1
                        ? widget.bumbuMasakSub.length - 1
                        : 0, (index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        widget.bumbuMasakSub[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Wrap(
                      children: createItemss(
                          widget.bumbuMasakSub[index], widget.bumbuMasak),
                    ),
                  ],
                ),
              );
            })),
            widget.bahanKue.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      "Bahan Kue",
                      style: TextStyle(
                          fontFamily: 'Comic',
                          color: Colors.white,
                          fontSize: 17),
                    )),
                  )
                : Container(),
            Column(
                children: List.generate(
                    widget.bahankueSub.length > 1
                        ? widget.bahankueSub.length - 1
                        : 0, (index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        widget.bahankueSub[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Wrap(
                      children: createItemss(
                          widget.bahankueSub[index], widget.bahanKue),
                    )
                  ],
                ),
              );
            })),
            widget.produkOlahan.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      "Produk Olahan",
                      style: TextStyle(
                          fontFamily: 'Comic',
                          color: Colors.white,
                          fontSize: 17),
                    )),
                  )
                : Container(),
            Column(
                children: List.generate(
                    widget.produkOlahanSub.length > 1
                        ? widget.produkOlahanSub.length - 1
                        : 0, (index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        widget.produkOlahanSub[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Wrap(
                      children: createItemss(
                          widget.produkOlahanSub[index], widget.produkOlahan),
                    )
                  ],
                ),
              );
            })),
            widget.rumahTangga.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      "Rumah Tangga",
                      style: TextStyle(
                          fontFamily: 'Comic',
                          color: Colors.white,
                          fontSize: 17),
                    )),
                  )
                : Container(),
            Column(
                children: List.generate(
                    widget.rumahTanggaSub.length > 1
                        ? widget.rumahTanggaSub.length - 1
                        : 0, (index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        widget.rumahTanggaSub[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Wrap(
                      children: createItemss(
                          widget.rumahTanggaSub[index], widget.rumahTangga),
                    )
                  ],
                ),
              );
            })),
            widget.makanan.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      "Makanan",
                      style: TextStyle(
                          fontFamily: 'Comic',
                          color: Colors.white,
                          fontSize: 17),
                    )),
                  )
                : Container(),
            Column(
                children: List.generate(
                    widget.makananSub.length > 1
                        ? widget.makananSub.length - 1
                        : 0, (index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        widget.makananSub[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Wrap(
                      children: createItemss(
                          widget.makananSub[index], widget.makanan),
                    )
                  ],
                ),
              );
            })),
            widget.minuman.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      "Minuman",
                      style: TextStyle(
                          fontFamily: 'Comic',
                          color: Colors.white,
                          fontSize: 17),
                    )),
                  )
                : Container(),
            Column(
                children: List.generate(
                    widget.minumanSub.length > 1
                        ? widget.minumanSub.length - 1
                        : 0, (index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        widget.minumanSub[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Wrap(
                      children: createItemss(
                          widget.minumanSub[index], widget.minuman),
                    )
                  ],
                ),
              );
            })),
            widget.ibuanak.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      "Ibu dan Anak",
                      style: TextStyle(
                          fontFamily: 'Comic',
                          color: Colors.white,
                          fontSize: 17),
                    )),
                  )
                : Container(),
            Column(
                children: List.generate(
                    widget.ibuanakSub.length > 1
                        ? widget.ibuanakSub.length - 1
                        : 0, (index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        widget.ibuanakSub[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Wrap(
                      children: createItemss(
                          widget.ibuanakSub[index], widget.ibuanak),
                    )
                  ],
                ),
              );
            })),
            widget.kesehatan.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      "Kesehatan",
                      style: TextStyle(
                          fontFamily: 'Comic',
                          color: Colors.white,
                          fontSize: 17),
                    )),
                  )
                : Container(),
            Column(
                children: List.generate(
                    widget.kesehatanSub.length > 1
                        ? widget.kesehatanSub.length - 1
                        : 0, (index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        widget.kesehatanSub[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Wrap(
                      children: createItemss(
                          widget.kesehatanSub[index], widget.kesehatan),
                    )
                  ],
                ),
              );
            })),
            widget.pertubuh.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      "Perawatan Tubuh",
                      style: TextStyle(
                          fontFamily: 'Comic',
                          color: Colors.white,
                          fontSize: 17),
                    )),
                  )
                : Container(),
            Column(
                children: List.generate(
                    widget.pertubuhSub.length > 1
                        ? widget.pertubuhSub.length - 1
                        : 0, (index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        widget.pertubuhSub[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Wrap(
                      children: createItemss(
                          widget.pertubuhSub[index], widget.pertubuh),
                    )
                  ],
                ),
              );
            })),
          ],
        ),
      ),
    );
  }

  List<Widget> createItemss(String subKategori, List<Data_barang> subBarang) {
    List<Widget> items = List<Widget>();
    for (var i = 0; i < subBarang.length; i++) {
      if (subBarang[i].nama_subkategori == subKategori) {
        items.add(gestureTouch(subBarang[i]));
      }
    }
    return items;
  }

  Widget gestureTouch(Data_barang subBarang) {
    return new GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => new DetailBarangBaru(
                  db: subBarang,
                )));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 5),
        // color: Colors.blue,
        width: 150,
        height: 230,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5,
              spreadRadius: 0.5,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 149,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  "assets/images/barang/bimoli_botol.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 3, top: 3),
              child: Text(
                subBarang.nama_barang,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comic',
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Rp. " + subBarang.harga_barang.toString(),
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Comic'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<BelanjaProvider>(context, listen: false)
                            .AddListBelanja(listbelanja: subBarang);
                        toastClickButton("Ditambahkan");
                      },
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Center(
                          child: Container(
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget gestureTouch(Data_barang subBarang) {
//     return new GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (_) => DetailBarangBaru(
//                   db: subBarang,
//                 )));
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         // color: Colors.blue,
//         width: 125,
//         // height: 100,
//         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         decoration: BoxDecoration(color: Colors.blue),
//         child: Center(
//             child: Text(
//           subBarang.nama_barang,
//           textAlign: TextAlign.center,
//         )),
//       ),
//     );
//   }
