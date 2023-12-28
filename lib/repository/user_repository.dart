// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:myshop/models/user.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;

  // FirebaseAuth auth = FirebaseAuth.instance;

  // DatabaseReference ref = FirebaseDatabase.instance.ref().child("User");

  // void signup(
  //     String firstName, String lastName, String phoneNumber, String address) {
  //   ref.child();
  // }

  Future<void> userData(UserModel user, BuildContext context) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // Set the UID explicitly in the user model
        user = UserModel(
          id: currentUser.uid,
          firstName: user.firstName,
          lastName: user.lastName,
          phoneNumber: user.phoneNumber,
          address: user.address,
        );

        // Add user data to Firestore
        await _db.collection("User").add(user.toJson());

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User data added successfully!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      print("Error adding user data: $error");
    }
  }

  Future<UserModel?> getUserData(String userId) async {
    try {
      DocumentSnapshot userSnapshot =
          await _db.collection('User').doc(userId).get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;
        return UserModel(
          firstName: userData['FirstName'] ?? '',
          lastName: userData['LastName'] ?? '',
          phoneNumber: userData['PhoneNumber'] ?? '',
          address: userData['address'] ?? '',
        );
      }
    } catch (error) {
      print("Error getting user data: $error");
    }

    return null;
  }
}
