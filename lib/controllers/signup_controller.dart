// ignore_for_file: file_names, unused_field, body_might_complete_normally_nullable, unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myshop/new_models/new_user_model.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential?> signUpMethod(
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    // String userImg,
    String address,
    String password,
    // String confirmPassword,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber,
          // userImg: '',
          address: address,
          password: password,
          // confirmPassword: confirmPassword
          );

      // add data into database
      _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  Future<UserModel?> getUserData(String userId) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(userId).get();

      if (userDoc.exists) {
        // Convert the document data to a UserModel instance
        UserModel userData = UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
        return userData;
      } else {
        // Handle the case where the user document does not exist
        Get.snackbar(
          "Error",
          "User data not found.",
          snackPosition: SnackPosition.BOTTOM,
        );
        return null;
      }
    } catch (e) {
      // Handle any errors that may occur during the fetch
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    }
  }
}
