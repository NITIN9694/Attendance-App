import 'package:presentsir/Teachers/firstpage.dart';

import 'mainscreen.dart';
import 'package:flutter/material.dart';

class Front_Page extends StatefulWidget {
  @override
  _Front_PageState createState() => _Front_PageState();
}

class _Front_PageState extends State<Front_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.orange[200], Colors.white])),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Are You?",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                    child: Center(
                      child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset('assests/image/teacher.png')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    },
                    child: Center(
                      child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset('assests/image/studentt.png')),
                    ),
                  ),
                ),
              ],
            )));
  }
}
