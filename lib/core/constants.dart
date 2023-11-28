import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppConstant{
  static const userAccessToken="User_Access_Token";
  static late int maxPages;
  static Future<bool?> appToast({
    required String text,
    required Color color,
  }) =>
      Fluttertoast.showToast(
          msg: text,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: color,
          textColor: Colors.white,
          fontSize: 16.0);
}