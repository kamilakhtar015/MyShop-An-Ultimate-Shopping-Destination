// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myshop/components/custom_sufix_icon.dart';
import 'package:myshop/components/default_button.dart';
import 'package:myshop/screens/complete_profile/complete_profile.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: Column(
          children: [
            email(),
            SizedBox(height: screenHeight * 0.04),
            password(),
            SizedBox(height: screenHeight * 0.04),
            confirmPassword(),
            SizedBox(height: screenHeight * 0.04),
            DefaultButton(
              text: "Continue",
              width: 300,
              height: 48,
              press: () async {
                if (_formKey.currentState!.validate()) {
                  // If form is valid, proceed with Firebase signup
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );

                    // Successful signup, navigate to CompleteProfileScreen
                    Navigator.pushNamed(
                        context, CompleteProfileScreen.routeName);
                    // HomeScreen.routeName);
                  } on FirebaseAuthException catch (error) {
                    // Clear password field on error
                    passwordController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.toString())));
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Email Method
  TextFormField email() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your email address";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufixIcon(svgIcon: 'assets/icons/Mail.svg'),
      ),
    );
  }

  // Password Method
  TextFormField password() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your password";
        }

        // Password must contain at least one uppercase letter
        if (!value.contains(RegExp(r'[A-Z]'))) {
          return 'Password must contain at least one uppercase letter';
        }

        // Password must contain at least one lowercase letter
        if (!value.contains(RegExp(r'[a-z]'))) {
          return 'Password must contain at least one lowercase letter';
        }

        // Password must contain at least one special character
        if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
          return 'Password must contain at least one special character';
        }

        // Password must contain at least one digit
        if (!value.contains(RegExp(r'[0-9]'))) {
          return 'Password must contain at least one digit';
        }

        // Password must be at least 7 characters long
        if (value.length < 7) {
          return 'Password must be at least 7 characters long';
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }

  // Confirm Password
  TextFormField confirmPassword() {
    return TextFormField(
      obscureText: true,
      controller: confirmPasswordController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please re-enter your password";
        }
        if (value != passwordController.text) {
          return "Passwords do not match";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }
}
