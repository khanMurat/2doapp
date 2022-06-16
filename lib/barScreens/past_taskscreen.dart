// ignore_for_file: prefer_const_constructors

import 'package:do2app/constant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PastScreen extends StatefulWidget {
  @override
  State<PastScreen> createState() => _PastScreenState();
}

class _PastScreenState extends State<PastScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Stream<QuerySnapshot> _pastStream =
      FirebaseFirestore.instance.collection('past').snapshots();

  bool asyncCall = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: Icon(Icons.exit_to_app),
        onPressed: () {
          _auth.signOut();
          Navigator.pop(context);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: Text(
              'PAST TASKS',
              style: kPastTaskTextStyle,
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: _pastStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              return Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: snapshot.data!.docs.map(
                      (DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return Card(
                          color: Colors.grey,
                          margin: EdgeInsets.all(5),
                          child: ListTile(
                            title: Text(data['task']),
                            trailing: Icon(Icons.timelapse_rounded),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
