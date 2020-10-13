import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:presentsir/Teachers/class.dart';
import 'package:presentsir/Teachers/firstpage.dart';
import 'package:presentsir/screen/front_page.dart';
import 'package:presentsir/screen/mainscreen.dart';
import 'package:presentsir/screen/second.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Front_Page();
  }
}
