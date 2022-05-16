// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_tutorial/databasemanager.dart';
import 'package:firestore_tutorial/Student.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<bool> _buttonsState = List.generate(4, (index) => false);
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return MaterialApp(
      title: 'RecordAttendance',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Record Attendance'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: db.collection('Student').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                  children: snapshot.data!.docs.map((Student) {
                return Card(
                    child: ListTile(
                        title: Text(Student['Name']),
                        subtitle: Text(Student['Roll No']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              child: Text('Present'),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Student Marked Present')));
                                var rollno = Student['Roll No'];
                                DatabaseManager().StudentPresent(rollno);
                              },
                            ),
                            ElevatedButton(
                              child: Text('Absent'),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Student Marked Absent')));
                                var rollno = Student['Roll No'];
                                DatabaseManager().StudentAbsent(rollno);
                              },
                            ),
                          ],
                        )));
              }).toList());
            }
          },
        ),
      ),
    );
  }
}
