// ignore_for_file: use_build_context_synchronously, avoid_print, library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myshop/screens/sign_in/sign_in_screen.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';
import 'package:myshop/new_models/new_user_model.dart';
import 'package:myshop/repository/signup_controller.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      UserModel? fetchedUser = await SignUpController().getUserData(user.uid);
      setState(() {
        userModel = fetchedUser;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            if (userModel != null) ...[
              Text('Name: ${userModel!.firstName} ${userModel!.lastName}'),
              Text('Phone Number: ${userModel!.phoneNumber}'),
              Text('Address: ${userModel!.address}'),
            ] else ...[
              const CircularProgressIndicator(),
              const Text('User data not found.'),
            ],
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    SignInScreen.routeName,
                    (route) => false, // Remove all existing routes
                  );
                } catch (e) {
                  print("Error during log-out: $e");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
