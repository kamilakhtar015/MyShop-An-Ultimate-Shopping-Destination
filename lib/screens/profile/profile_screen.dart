// // ignore_for_file: use_build_context_synchronously, avoid_print

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:myshop/components/custom_navbar.dart';

// import 'package:myshop/enums.dart';
// import 'package:myshop/screens/sign_in/sign_in_screen.dart';

// import 'components/profile_menu.dart';
// import 'components/profile_pic.dart';

// class ProfileScreen extends StatelessWidget {
//   static String routeName = "/profile";

//   const ProfileScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             "Profile",
//             style: TextStyle(color: Colors.black),
//           )),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: Column(
//           children: [
//             const ProfilePic(),
//             const SizedBox(height: 20),
//             // after the profile pic I want to show the user details that are store in the
//             // firebase in the User collection
//             ProfileMenu(
//               text: "Log Out",
//               icon: "assets/icons/Log out.svg",
//               press: () async {
//                 try {
//                   await FirebaseAuth.instance.signOut();
//                   // Navigate to the HomeScreen after successful log-out
//                   Navigator.pushNamedAndRemoveUntil(
//                     context,
//                     SignInScreen.routeName,
//                     (route) => false, // Remove all existing routes
//                   );
//                 } catch (e) {
//                   print("Error during log-out: $e");
//                   // Handle log-out error if needed
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.profile),
//     );
//   }
// }

// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myshop/models/user.dart';
import 'package:myshop/repository/user_repository.dart';

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
      UserModel? fetchedUser = await UserRepository().getUserData(user.uid);
      setState(() {
        userModel = fetchedUser;
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // Display user data if available
            if (userModel != null) ...[
              Text('Name: ${userModel!.firstName} ${userModel!.lastName}'),
              Text('Phone Number: ${userModel!.phoneNumber}'),
              Text('Address: ${userModel!.address}'),
              // Add more Text widgets to display other user information
            ] else ...[
              // Display loading indicator or user not found message
              CircularProgressIndicator(),
              Text('User data not found.'),
            ],
          ],
        ),
      ),
    );
  }
}
