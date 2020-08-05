import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_digital/view/belanja/detail_barang.dart';
import 'package:toko_digital/view/belanja/provider/belanja_provider.dart';
import 'package:toko_digital/controller/toast_handling.dart';

import '../../../model/data_barang.dart';
import '../../../model/data_barang.dart';

class ListBahanPokok extends StatefulWidget {
  final List<Data_barang> bahanPokok;
  final List<String> bahanPokokSub;
  ListBahanPokok({this.bahanPokok, this.bahanPokokSub});

  @override
  _ListBahanPokokState createState() => _ListBahanPokokState(
      bahanPokok: bahanPokok, bahanPokokSub: bahanPokokSub);
}

class _ListBahanPokokState extends State<ListBahanPokok> {
  final List<Data_barang> bahanPokok;
  final List<String> bahanPokokSub;
  _ListBahanPokokState({this.bahanPokokSub, this.bahanPokok});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(7),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green.shade600,
                      ),
                      child: Text(
                        widget.bahanPokokSub[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Comic',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Wrap(
                      children: createItemss(
                          widget.bahanPokokSub[index], widget.bahanPokok),
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
