import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String api_link = "https://apihomechef.antopolis.xyz/";

showToast(String title) {
  return Fluttertoast.showToast(
      msg: "$title",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0);
}
