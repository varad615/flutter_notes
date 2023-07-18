import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:notes/screens/addnote.dart';
import 'package:notes/screens/viewnote.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => AddNote(),
              ),
            )
                .then((value) {
              print("Calling Set  State !");
              setState(() {});
            });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Color(0xFF693DA1),
        ),
        //
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF693DA1),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Color(0xFF693DA1),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                )),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        //
        body: Column(
          children: [],
        ));
  }
}
