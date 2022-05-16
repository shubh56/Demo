// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_tutorial/Student.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: RecordAttendance()));
}

class RecordAttendance extends StatefulWidget {
  const RecordAttendance({Key? key}) : super(key: key);

  @override
  State<RecordAttendance> createState() => _RecordAttendanceState();
}

class _RecordAttendanceState extends State<RecordAttendance> {
  final nameTextController = TextEditingController();
  final rollnoTextController = TextEditingController();

  void AddStudent() {
    var db = FirebaseFirestore.instance;
    final student = {
      'Name': nameTextController.text.toString(),
      'Roll No': rollnoTextController.text.toString()
    };
    db
        .collection("Student")
        .doc(rollnoTextController.text.toString())
        .set(student, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    // CollectionReference Student =
    //     FirebaseFirestore.instance.collection('Student');
    return MaterialApp(
      title: 'Record Attendance',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Record Attendance'),
          ),
          body: Center(
              child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter Name',
                  ),
                  controller: nameTextController),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Roll No',
                  hintText: 'Enter Roll No',
                ),
                controller: rollnoTextController,
              ),
              ElevatedButton(onPressed: AddStudent, child: Text('Submit')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentList()));
                  },
                  child: Text('Record Attendance'))
            ],
          ))),
    );
  }
}
