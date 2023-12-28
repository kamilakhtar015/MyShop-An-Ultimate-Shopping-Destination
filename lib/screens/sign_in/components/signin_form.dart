// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myshop/components/custom_sufix_icon.dart';
import 'package:myshop/components/default_button.dart';
// import 'package:myshop/screens/forget_password/forget_password_screen.dart';
// import 'package:myshop/screens/home/home_screen.dart';
import 'package:myshop/screens/login_success/login_success_screen.dart';
// import 'package:myshop/screens/login_success/login_success_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String emailError = '';
  String passwordError = '';

  void showFirebaseErrorSnackbar(BuildContext context, String errorCode) {
    String errorMessage;

    // Map Firebase error codes to user-friendly messages
    switch (errorCode) {
      case 'invalid-email':
        errorMessage = 'Invalid email address';
        break;
      case 'user-not-found':
        errorMessage = 'User not found. Please sign up.';
        break;
      case 'wrong-password':
        errorMessage = 'Wrong password. Please try again.';
        break;
      default:
        errorMessage = 'Authentication failed. Please try again.';
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }

  String validateEmail(String email) {
    if (email.isEmpty || !email.contains('@')) {
      return 'Please enter a valid email address';
    }
    return '';
  }

  String validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    }

    return ''; // No error
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          email(),
          if (emailError.isNotEmpty)
            Text(
              emailError,
              style: const TextStyle(color: Colors.red),
            ),
          SizedBox(
            height: screenHeight * 0.04,
          ),
          password(),
          if (passwordError.isNotEmpty)
            Text(
              passwordError,
              style: const TextStyle(color: Colors.red),
            ),
          SizedBox(
            height: screenHeight * 0.04,
          ),
          // Row(
          //   children: [
          //     Checkbox(
          //       value: false,
          //       onChanged: (value) {},
          //     ),
          //     const Text('Remember me'),
          //     const Spacer(),
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.pushNamed(context, ForgetPasswordScreen.routneName);
          //       },
          //       child: const Text(
          //         "Forget password",
          //         style: TextStyle(decoration: TextDecoration.underline),
          //       ),
          //     )
          //   ],
          // ),
          SizedBox(
            height: screenHeight * 0.06,
          ),
          DefaultButton(
            text: "Continue",
            width: 300,
            height: 48,
            press: () async {
              String email = _emailController.text;
              String password = _passwordController.text;

              // Validate email and password
              String emailError = validateEmail(email);
              String passwordError = validatePassword(password);

              // Update state with error messages
              setState(() {
                this.emailError = emailError;
                this.passwordError = passwordError;
              });

              // Check if there are no validation errors
              if (emailError.isEmpty && passwordError.isEmpty) {
                // If all are valid, proceed with Firebase authentication
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  // Successful sign-in, navigate to HomeScreen
                  Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                } on FirebaseAuthException catch (error) {
                  // Handle authentication errors
                  showFirebaseErrorSnackbar(context, error.code);
                }
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField password() {
    return TextFormField(
      obscureText: true,
      controller: _passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            passwordError = "Please enter your password";
          });
        } else {
          passwordError = '';
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

  TextFormField email() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            emailError = "Please enter your email address";
          });
        } else {
          emailError = '';
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
}


    // Form(
    //   key: _formKey,
    //   child: Column(children: [
    //     email(),
    //     if (emailError.isNotEmpty)
    //       Text(
    //         emailError,
    //         style: const TextStyle(color: Colors.red),
    //       ),
    //     SizedBox(
    //       height: screenHeight * 0.04,
    //     ),
    //     password(),
    //     if (passwordError.isNotEmpty)
    //       Text(
    //         passwordError,
    //         style: const TextStyle(color: Colors.red),
    //       ),
    //     SizedBox(
    //       height: screenHeight * 0.04,
    //     ),
    //     Row(
    //       children: [
    //         Checkbox(
    //           value: false,
    //           onChanged: (value) {},
    //         ),
    //         const Text('Remeber me'),
    //         const Spacer(),
    //         GestureDetector(
    //           onTap: () {
    //             Navigator.pushNamed(context, ForgetPasswordScreen.routneName);
    //           },
    //           child: const Text("Forget password",
    //               style: TextStyle(decoration: TextDecoration.underline)),
    //         )
    //       ],
    //     ),
    //     SizedBox(
    //       height: screenHeight * 0.06,
    //     ),
    //     DefaultButton(
    //       text: "Continue",
    //       width: 300,
    //       height: 48,
    //       press: () {
    //         // Validate form and show error messages
    //         if (_formKey.currentState!.validate()) {
    //           // if all are valid then go to success screen
    //           Navigator.pushNamed(context, LoginSuccessScreen.routeName);
    //         }
    //       },
    //     )
    //   ]),
    // );