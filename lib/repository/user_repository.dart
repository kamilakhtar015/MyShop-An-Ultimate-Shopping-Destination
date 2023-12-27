// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myshop/models/user.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;

  Future<void> userData(UserModel user, BuildContext context) async {
    try {
      await _db.collection("User").add(user.toJson());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User data added successfully!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      print("Error adding user data: $error");
    }
  }
}
