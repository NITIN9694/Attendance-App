import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presentsir/Teachers/firstpage.dart';
import 'package:presentsir/service/cured.dart';
import 'package:presentsir/service/cured.dart';

class Classname extends StatefulWidget {
  @override
  _ClassnameState createState() => _ClassnameState();
}

class _ClassnameState extends State<Classname> {
  TextEditingController classeedtiingcontroleer = TextEditingController();
  bool isLoding = false;
  SeCuredmethod seCuredmethod = SeCuredmethod();

  uploadeclassname() async {
    Map<String, String> classname = {
      "Physics": classeedtiingcontroleer.text,
    };
    seCuredmethod.addData(classname);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FirstPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.orange[200], Colors.white])),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 200),
                child: TextFormField(
                  controller: classeedtiingcontroleer,
                  decoration: InputDecoration(hintText: "Enter Class name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                    color: Colors.black,
                    child: Text(
                      "Upload",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      uploadeclassname();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
