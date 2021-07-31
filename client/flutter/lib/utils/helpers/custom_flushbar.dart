import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
class CustomFlushBarHelper {
  static Flushbar createSuccess({required String title,required String message,int timeout = 4}) {
    return Flushbar(
      title:title,
      message: message,
      icon: Icon(
        Icons.info,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: timeout),
      borderRadius: BorderRadius.circular(18),
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: EdgeInsets.all(8),
    );
  }
  static Flushbar createError({required String title,required String message,int timeout = 4}) {
    return Flushbar(
      title:title,
      message: message,
      icon: Icon(
        Icons.info,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: timeout),
      borderRadius: BorderRadius.circular(18),
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: EdgeInsets.all(8),
    );
  }
}