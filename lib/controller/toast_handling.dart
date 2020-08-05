import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastClickButton(String kata) async {
  Fluttertoast.showToast(
    msg: kata,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black38,
    textColor: Colors.white,
    fontSize: 13,
  );
}
