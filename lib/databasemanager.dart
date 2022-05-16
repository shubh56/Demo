// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseManager {
  void StudentPresent(rollno) {
    var db = FirebaseFirestore.instance;
  }

  void StudentAbsent(rollno) {}
}
