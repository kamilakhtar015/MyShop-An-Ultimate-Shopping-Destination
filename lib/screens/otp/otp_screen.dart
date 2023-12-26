import 'package:flutter/material.dart';
import 'package:myshop/screens/otp/components/body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  static String routeName = '/otp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OTP Verification',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
