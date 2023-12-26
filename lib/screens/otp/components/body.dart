import 'package:flutter/material.dart';
import 'package:myshop/components/default_button.dart';
import 'package:myshop/constants.dart';
import 'package:myshop/screens/otp/components/otp_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("OTP Verfication", style: headingStyle),
              const Text("We send you code to +92 355 123 ***"),
              buildTimer(),
              SizedBox(height: screenheight * 0.15),
              const OtpForm(),
              SizedBox(height: screenheight * 0.15),
              DefaultButton(text: "Continue", press: () {},            width: 300,
            height: 48,),
              SizedBox(height: screenheight * 0.15),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(
              color: kPrimaryColor,
            ),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}
