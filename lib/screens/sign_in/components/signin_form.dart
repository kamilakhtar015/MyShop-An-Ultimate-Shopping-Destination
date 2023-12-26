import 'package:flutter/material.dart';
import 'package:myshop/components/custom_sufix_icon.dart';
import 'package:myshop/components/default_button.dart';
import 'package:myshop/screens/forget_password/forget_password_screen.dart';
import 'package:myshop/screens/login_success/login_success_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String emailError = '';
  String passwordError = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(children: [
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
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            const Text('Remeber me'),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ForgetPasswordScreen.routneName);
              },
              child: const Text("Forget password",
                  style: TextStyle(decoration: TextDecoration.underline)),
            )
          ],
        ),
        SizedBox(
          height: screenHeight * 0.06,
        ),
        DefaultButton(
          text: "Continue",
                      width: 300,
            height: 48,
          press: () {
            // Validate form and show error messages
            if (_formKey.currentState!.validate()) {
              // if all are valid then go to success screen
              Navigator.pushNamed(context, LoginSuccessScreen.routeName);
            }
          },
        )
      ]),
    );
  }

  TextFormField password() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
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
      controller: emailController,
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
