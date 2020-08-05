import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_digital/view/belanja/provider/belanja_provider.dart';

import '../FormPage.dart';

class Keranjang extends StatelessWidget {
  void alertLanjutPengantaran(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Periksa Kembali Data Belanjaan Anda"),
      content: Text("Apakah Data Belanjaan Anda Sudah Benar ?"),
      actions: <Widget>[
        RaisedButton(
          color: Colors.green.shade600,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Belum"),
        ),
        RaisedButton(
          color: Colors.green.shade600,
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return FormPage();
            }));
          },
          child: Text("Ya"),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: Text(
          "List Data Belanjaan",
          style: TextStyle(fontFamily: 'Comic'),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          Provider.of<BelanjaProvider>(context)
                              .listBelanja[index]
                              .databarang
                              .nama_barang,
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: 'Comic',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Rp. " +
                                Provider.of<BelanjaProvider>(context)
                                    .listBelanja[index]
                                    .databarang
                                    .harga_barang
                                    .toString(),
                            style: TextStyle(
                              fontFamily: 'Comic',
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Provider.of<BelanjaProvider>(context,
                                            listen: false)
                                        .decrBelanjaan(index: index);
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade600,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  Provider.of<BelanjaProvider>(context)
                                      .listBelanja[index]
                                      .jumlah
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: 'Comic',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Provider.of<BelanjaProvider>(context,
                                            listen: false)
                                        .incrBelanjaan(index: index);
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade600,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              "Rp. " +
                                  Provider.of<BelanjaProvider>(context)
                                      .listBelanja[index]
                                      .harga
                                      .toString(),
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Comic',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 3),
                    child: Divider(
                      height: 3,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: Provider.of<BelanjaProvider>(context).listBelanja.length,
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.shade300)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Harga :",
                    style: TextStyle(
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
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comic',
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed:
                  Provider.of<BelanjaProvider>(context).listBelanja.length > 0
                      ? () {
                          alertLanjutPengantaran(context);
                        }
                      : null,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green.shade600,
                ),
                child: Text(
                  "Lanjut\nPembayaran",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Comic',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
