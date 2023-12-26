import 'package:flutter/material.dart';
import 'package:myshop/components/custom_sufix_icon.dart';
import 'package:myshop/components/default_button.dart';
import 'package:myshop/screens/otp/otp_screen.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
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
            firtName(),
            SizedBox(height: screenHeight * 0.04),
            lastName(),
            SizedBox(height: screenHeight * 0.04),
            phoneNumber(),
            SizedBox(height: screenHeight * 0.04),
            address(),
            SizedBox(height: screenHeight * 0.04),
            DefaultButton(
              text: "Continue",
              press: () {
                Navigator.pushNamed(context, OtpScreen.routeName);
              },
              width: 300,
              height: 48,
            )
          ],
        ),
      ),
    );
  }

  // Email Method
  TextFormField firtName() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your first name";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufixIcon(svgIcon: 'assets/icons/User.svg'),
      ),
    );
  }

  TextFormField lastName() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your first name";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your Last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufixIcon(svgIcon: 'assets/icons/User.svg'),
      ),
    );
  }

  TextFormField phoneNumber() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your first name";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufixIcon(svgIcon: 'assets/icons/Phone.svg'),
      ),
    );
  }

  TextFormField address() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your first name";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Address",
        hintText: "Enter your Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufixIcon(svgIcon: 'assets/icons/Location point.svg'),
      ),
    );
  }
}
