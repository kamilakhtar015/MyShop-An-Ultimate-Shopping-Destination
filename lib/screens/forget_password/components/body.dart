// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:myshop/components/custom_sufix_icon.dart';
import 'package:myshop/components/default_button.dart';
import 'package:myshop/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Forgot Password",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Please enter your email address and we will send \nyou a link to return to your account',
            textAlign: TextAlign.center,
          ),
          ForgotPassForm(),
        ],
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key});

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.08,
          ),
          TextFormField(
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
          ),
          SizedBox(
            height: screenHeight * 0.08,
          ),
          DefaultButton(
            text: 'Continue',
            press: () {},
            width: 300,
            height: 48,
          ),
          SizedBox(
            height: screenHeight * 0.08,
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
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: screenWidth *
                      0.05, // Adjust font size based on screen width
                  color: kPrimaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
