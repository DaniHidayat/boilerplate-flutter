import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastCustom {
  static toastError(String pesan) => Fluttertoast.showToast(
      msg: pesan,
      // ignore: prefer_const_constructors
      backgroundColor: Color(0xFFD22027),
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,);
  static toastSuccess(String pesan) => Fluttertoast.showToast(
      msg: pesan,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM, 
      toastLength: Toast.LENGTH_LONG,);

  static toastInfo(String pesan) => Fluttertoast.showToast(
      msg: pesan,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM);
}
