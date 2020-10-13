import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:presentsir/service/AttendenceFrom.dart';

class Sheet {
  final void Function(String) callback;
  static const String url =
      "https://script.google.com/macros/s/AKfycby-I9kxrKLzGyZS-aH9LWAZnLqt1bRgCGDv-ClybCY0tew5ySU/exec";

  static const STATUS_SUCESS = "SUCUCESS";
  Sheet(this.callback);

  void submitForm(FeedbackForm feedbackForm) async {
    try {
      await http.get(url + feedbackForm.toString()).then(
          (response) => callback(convert.jsonDecode(response.body)['sataus']));
    } catch (r) {
      print(r);
    }
  }
}
