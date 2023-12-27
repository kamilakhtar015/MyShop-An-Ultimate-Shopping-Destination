// import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String address;

  const UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "PhoneNumber": phoneNumber,
      "address": address,
    };
  }

  // // Factory constructor to create a User from a Firestore document snapshot
  // factory User.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
  //   return User(
  //     firstName: doc['firstName'],
  //     lastName: doc['lastName'],
  //     phoneNumber: doc['phoneNumber'],
  //     address: doc['address'],
  //   );
  // }

  // // Map the User object to a Map for Firestore
  // Map<String, dynamic> toMap() {
  //   return {
  //     'firstName': firstName,
  //     'lastName': lastName,
  //     'phoneNumber': phoneNumber,
  //     'address': address,
  //   };
  // }
}
