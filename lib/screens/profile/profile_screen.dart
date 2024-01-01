// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myshop/constants.dart';
import 'package:myshop/controllers/signup_controller.dart';
import 'package:myshop/new_models/new_user_model.dart';
import 'package:myshop/screens/cart/cart_screen.dart';
import 'package:myshop/screens/profile/change_password.dart';
import 'package:myshop/screens/profile/components/profile_pic.dart';
import 'package:myshop/screens/sign_in/sign_in_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  static String routeName = "/profile";

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  void _openChangePasswordBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const PasswordChangeBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: kPrimaryColor.withOpacity(0.7),
                height: screenWidth * 0.8,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(bottom: screenWidth * 0.25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Center(
                        child: ProfilePic(),
                      ),
                      if (userModel != null)
                        Text(
                          '${userModel!.firstName} ${userModel!.lastName}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              // height: screenWidth * 0.3,
              child: Column(
                children: [
                  personalInfo(),
                  // buildMenuItem('location_city', 'Change Address'),
                  // buildMenuItem('email', 'Change Email'),
                  buildMenuItem(
                    'password',
                    'Change Password',
                    _openChangePasswordBottomSheet,
                  ),
                  buildMenuItem('logout', 'Log Out', () async {
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
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding personalInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kPrimaryColor,
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: () {
          _showPersonalInfoBottomSheet(context);
        },
        child: const Row(
          children: [
            Icon(
              Icons.person,
              color: kPrimaryColor,
              size: 30,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                'Personal Info',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Future<void> _showPersonalInfoBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (userModel != null) ...[
                buildUserInfoRow('First Name', userModel!.firstName),
                buildUserInfoRow('Last Name', userModel!.lastName),
                buildUserInfoRow('Phone Number', userModel!.phoneNumber),
                buildUserInfoRow('Address', userModel!.address),
              ] else ...[
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
                const Text(
                  'User data not found.',
                  style: TextStyle(
                    color: Colors
                        .red, // You can change the color to fit your theme
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget buildUserInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Padding buildMenuItem(String icon, String text, VoidCallback? onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kPrimaryColor,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              getIconData(icon),
              color: kPrimaryColor,
              size: 30,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  IconData getIconData(String icon) {
    switch (icon) {
      case 'location_city':
        return Icons.location_city;
      case 'email':
        return Icons.email;
      case 'password':
        return Icons.password;
      case 'logout':
        return Icons.logout;
      // Add more cases as needed
      default:
        return Icons.error; // Default icon if not found
    }
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height * 0.6, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
