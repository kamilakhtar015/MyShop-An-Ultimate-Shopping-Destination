import 'package:flutter/material.dart';
import 'package:myshop/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign In",
          style: TextStyle(
            color: Color(0XFF8B8B8B),
            fontSize: 18,
          ), // Set text color to black
        ),
        centerTitle: true, // Center the title
      ),

      body: const Body(),

    );
  }
}
