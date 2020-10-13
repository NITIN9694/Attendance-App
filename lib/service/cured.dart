import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:presentsir/Teachers/class.dart';

class Crudemethod {
  Future<void> addData(textdata) async {
    // ignore: deprecated_member_use
    Firestore.instance.collection('texts').add(textdata).catchError((e) {
      print(e);
    });
  }

  getdata() async {
    return await Firestore.instance.collection('texts').getDocuments();
  }
}

class SeCuredmethod {
  Future<void> addData(classtext) async {
    Firestore.instance.collection("Classname").add(classtext).catchError((e) {
      print(e);
    });
  }
}
