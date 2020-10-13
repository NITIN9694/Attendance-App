import 'package:flutter/material.dart';
import 'package:presentsir/service/cured.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'mainscreen.dart';
import 'package:presentsir/service/AttendenceFrom.dart';
import 'package:presentsir/service/sheetapi.dart';

class Sec extends StatefulWidget {
  @override
  _SecState createState() => _SecState();
}

class _SecState extends State<Sec> {
  Crudemethod crudemethod = Crudemethod();
  Stream textstrem;
  QuerySnapshot textsnapshot;
  final _fromkey = GlobalKey<FormState>();
  TextEditingController rollnumberediting = TextEditingController();
  TextEditingController namecontroler = TextEditingController();
  final _scaffolkey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textstrem = Firestore.instance.collection("texts").snapshots();
  }

  Widget deletlist() {
    return Container(
      alignment: Alignment.center,
      color: Colors.redAccent[200],
      padding: EdgeInsets.only(right: 20),
      child: Icon(Icons.delete, color: Colors.white),
    );
  }

  Widget sendData() {
    return Container(
      alignment: Alignment.center,
      color: Colors.black54,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
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
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.orange[200], Colors.white])),
        child: StreamBuilder(
          stream: textstrem,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot course = snapshot.data.documents[index];
                dynamic getdata = course.data();

                return Dismissible(
                  key: Key(getdata[index]),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      getdata.remove(index);
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Item Deleted")));
                    } else if (direction == DismissDirection.startToEnd) {
                      _submitfrom();
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("undo $getdata"),
                        action: SnackBarAction(
                          label: "UNDO ITEM",
                          onPressed: () {
                            getdata.insert(
                              index,
                            );
                            setState(() {});
                          },
                        ),
                      ));
                    }
                  },
                  background: sendData(),
                  secondaryBackground: deletlist(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: ListTile(
                          title: Text(getdata['name']),
                          subtitle: Text(getdata['rollnumber']),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
