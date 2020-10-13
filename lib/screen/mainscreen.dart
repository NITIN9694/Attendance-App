import 'dart:io';
import 'package:flutter/material.dart';

import 'package:presentsir/screen/second.dart';

import 'package:presentsir/service/cured.dart';
import 'package:presentsir/service/AttendenceFrom.dart';
import 'package:presentsir/service/sheetapi.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String rollnumber, name;
  bool isLoding = false;
  final _fromkey = GlobalKey<FormState>();
  TextEditingController rollnumberediting = TextEditingController();
  TextEditingController namecontroler = TextEditingController();
  Crudemethod crudemethod = new Crudemethod();
  File textdata;
  final _scaffolkey = GlobalKey<ScaffoldState>();
  uploadBlog() async {
    Map<String, String> textput = {
      "rollnumber": rollnumberediting.text,
      "name": namecontroler.text,
    };
    crudemethod.addData(textput).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => Sec())));

    setState(() {
      isLoding = true;
    });
  }

  void _submitfrom() {
    if (_fromkey.currentState.validate()) {
      FeedbackForm feedbackfrom = FeedbackForm(
        namecontroler.text,
        rollnumberediting.text,
      );
      Sheet sheet = Sheet((String response) {
        print("Response: $response");
        if (response == Sheet.STATUS_SUCESS) {
          _showSnckbar("Submitfrom");
        } else {
          _showSnckbar("Error Ocurredd");
        }
      });
      _showSnckbar("Submitig Attendence");
      sheet.submitForm(feedbackfrom);
    }
  }

  _showSnckbar(String message) {
    final snackBar = SnackBar(content: Text(message));

    _scaffolkey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoding
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Form(
              key: _fromkey,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.orange[200], Colors.white])),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 100, left: 30, right: 30),
                      child: Center(
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Enter Valied rollnumber";
                            }
                            return null;
                          },
                          controller: rollnumberediting,
                          decoration:
                              InputDecoration(hintText: 'Eneter Roll number'),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 30, right: 30),
                      child: TextFormField(
                        controller: namecontroler,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Valied name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: 'Eneter  name'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orangeAccent,
                        child: MaterialButton(
                            child: Text(
                              "Upload",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              uploadBlog();
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
