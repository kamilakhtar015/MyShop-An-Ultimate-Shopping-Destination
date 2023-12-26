// ignore_for_file: use_key_in_widget_constructors

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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Form(
      child: Padding(
        // Adjust the horizontal padding based on screen width
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: Column(
          children: [
            email(),
            SizedBox(height: screenHeight * 0.04),
            password(),
            SizedBox(height: screenHeight * 0.04),
            confirnPassword(),
            SizedBox(height: screenHeight * 0.04),
            DefaultButton(
                text: "Continue",
                            width: 300,
            height: 48,
                press: () {
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                })
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
  TextFormField confirnPassword() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your password";
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
