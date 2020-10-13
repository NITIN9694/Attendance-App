import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presentsir/Teachers/class.dart';
import 'package:presentsir/screen/second.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Stream classstream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    classstream = Firestore.instance.collection("Classname").snapshots();
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
        child: Column(
          children: [
            StreamBuilder(
              stream: Firestore.instance.collection("Classname").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshpt) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshpt.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot classtext = snapshpt.data.documents[index];
                    dynamic getdata = classtext.data();
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: SizedBox(
                        height: 90,
                        width: 70,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Sec()));
                          },
                          child: Card(
                            color: Colors.white,
                            elevation: 10.0,
                            child: ListTile(
                              title: Center(
                                  child: Text(
                                getdata["Physics"],
                                style: TextStyle(
                                    color: Colors.orange[200],
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 190),
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Classname())),
                child: FloatingActionButton(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget textfile() {
  return Scaffold(
    body: Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: TextFormField(
            decoration: InputDecoration(hintText: "Enter Class name"),
          ),
        ),
      ),
    ),
  );
}
// }
//  StreamBuilder(

//               stream: classstream,
//               builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot) {
//                 return ListView(
//                   children:snapshot.
//                 )

//                 return ListView.builder(
//                   itemCount: snapshot.data.document.length,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot classtext = snapshot.data.document[index];
//                     dynamic getdata = classtext.data();
//                     return ListTile(
//                       title: Text(getdata["Classname"]),
//                     );
//                   },
//                 );
//               },
//             ),
