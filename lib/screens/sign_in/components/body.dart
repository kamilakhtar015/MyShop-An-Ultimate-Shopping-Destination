// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:myshop/components/social_card.dart';
import 'package:myshop/constants.dart';
import 'package:myshop/screens/sign_in/components/signin_form.dart';
import 'package:myshop/screens/sign_up/sign_up_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Sign in with your email and password \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: screenHeight * 0.08,
                ),
                const SignForm(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    SocialCard(
                      screenHeight: screenHeight,
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    const Spacer(),
                    SocialCard(
                      screenHeight: screenHeight,
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    const Spacer(),
                    SocialCard(
                      screenHeight: screenHeight,
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                    const Spacer()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an Account? ",
                      style: TextStyle(
                        fontSize: screenWidth *
                            0.04, // Adjust font size based on screen width
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, SignUpScreen.routeName),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: screenWidth *
                              0.05, // Adjust font size based on screen width
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
