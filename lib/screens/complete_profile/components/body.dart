import 'package:flutter/material.dart';
import 'package:myshop/constants.dart';
import 'package:myshop/screens/complete_profile/components/complete_profile_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Complete Profile',
              style: headingStyle,
            ),
            const Text(
              'Complete your details or continue \nwith social media',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.1),
            const CompleteProfileForm(),
            SizedBox(height: screenHeight * 0.08),
            const Text(
              'By continuing you confirm that you agree \nwith our Terms and Conditions',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
