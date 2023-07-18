import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late String title;
  late String desc;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFF9F9FB),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF693DA1),
        foregroundColor: Colors.white,
        onPressed: add,
        icon: Icon(Icons.save),
        label: Text('Save Note'),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Color(0xFF693DA1),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 30,
            )),
        title: Text(
          "New Note",
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF693DA1),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Color(0xFFF9F9FB),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Color(0xFFDADAEB)),
                    ),
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                    onChanged: (_val) {
                      title = _val;
                    },
                    maxLength: 20,
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Note',
                        hintStyle: TextStyle(color: Color(0xFFDADAEB)),
                      ),
                      style: TextStyle(fontSize: 32.0),
                      onChanged: (_val) {
                        desc = _val;
                      },
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    ));
  }

  void add() {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('notes');

    var data = {'title': title, 'description': desc, 'created': DateTime.now()};
    ref.add(data);
    Navigator.pop(context);
  }
}
