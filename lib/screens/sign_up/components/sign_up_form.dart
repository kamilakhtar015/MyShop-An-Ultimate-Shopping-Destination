// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myshop/components/custom_sufix_icon.dart';
import 'package:myshop/components/default_button.dart';
import 'package:myshop/repository/signup_controller.dart';
import 'package:myshop/screens/home/home_screen.dart';

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
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              email(),
              SizedBox(height: screenHeight * 0.04),
              password(),
              SizedBox(height: screenHeight * 0.04),
              confirmPassword(
                labelText: "Confirm Password",
                hintText: "Re-enter your password",
                suffixIcon: 'assets/icons/Lock.svg',
              ),
              SizedBox(height: screenHeight * 0.04),
              buildTextFormField(
                controller: firstNameController,
                labelText: "First Name",
                hintText: "Enter your first name",
                suffixIcon: 'assets/icons/User.svg',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your first name";
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.04),
              buildTextFormField(
                controller: lastNameController,
                labelText: "Last Name",
                hintText: "Enter your last name",
                suffixIcon: 'assets/icons/User.svg',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your last name";
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.04),
              buildTextFormField(
                controller: phoneNumberController,
                labelText: "Phone Number",
                hintText: "Enter your phone number",
                suffixIcon: 'assets/icons/Phone.svg',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your phone number";
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.04),
              buildTextFormField(
                controller: addressController,
                labelText: "Address",
                hintText: "Enter your address",
                suffixIcon: 'assets/icons/Location point.svg',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your address";
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.04),
              DefaultButton(
                text: "Continue",
                width: 300,
                height: 48,
                press: () async {
                  String email = emailController.text.trim();
                  String password = passwordController.text.trim();
                  String firstName = firstNameController.text.trim();
                  String lastName = lastNameController.text.trim();
                  String phoneNumber = phoneNumberController.text.trim();
                  String address = addressController.text.trim();

                  if (_formKey.currentState!.validate()) {
                    SignUpController signUpController = SignUpController();

                    try {
                      await signUpController.signUpMethod(firstName, lastName,
                          email, phoneNumber, address, password);

                      Navigator.pushNamed(context, HomeScreen.routeName);
                    } on FirebaseAuthException catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.toString())));
                    }
                  }
                },
              ),
            ],
          ),
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
  TextFormField confirmPassword({
    required String labelText,
    required String hintText,
    required String suffixIcon,
  }) {
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
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        suffixIcon: CustomSufixIcon(svgIcon: suffixIcon),
      ),
    );
  }

  TextFormField buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required String suffixIcon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        suffixIcon: CustomSufixIcon(svgIcon: suffixIcon),
      ),
    );
  }
}
