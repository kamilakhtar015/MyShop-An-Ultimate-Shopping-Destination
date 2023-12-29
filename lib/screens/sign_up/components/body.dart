// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
// import 'package:myshop/components/social_card.dart';
import 'package:myshop/constants.dart';
import 'package:myshop/screens/sign_up/components/sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.02),
          const Text(
            'Register Account',
            style: headingStyle,
          ),
          const Text(
            'Complete your details or continue \nwith social media',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.07),
          const SignUpForm(),
          SizedBox(height: screenHeight * 0.02),
          const Text(
            'By continuing you confirm that you agree \nwith our Terms and Conditions',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
