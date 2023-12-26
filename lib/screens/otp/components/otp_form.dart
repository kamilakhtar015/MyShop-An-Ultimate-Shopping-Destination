import 'package:flutter/material.dart';
import 'package:myshop/constants.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: screenWidth * 0.15,
            child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
              decoration: otpBoxDecoration(screenWidth),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.15,
            child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
              decoration: otpBoxDecoration(screenWidth),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.15,
            child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
              decoration: otpBoxDecoration(screenWidth),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.15,
            child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
              decoration: otpBoxDecoration(screenWidth),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration otpBoxDecoration(double screenWidth) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        vertical: screenWidth * 0.05,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: kTextColor,
        ),
      ),
    );
  }
}
