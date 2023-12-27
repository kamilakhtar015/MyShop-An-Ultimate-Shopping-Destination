import 'package:flutter/material.dart';
// import 'package:myshop/components/default_button.dart';
import 'package:myshop/constants.dart';
// import 'package:myshop/screens/sign_in/sign_in_screen.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "MyShop",
            style: TextStyle(
              fontSize: screenWidth * 0.08,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const Spacer(),
          const SizedBox(height: 20),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
          // const Spacer(
          //   flex: 2,
          // ),
          const SizedBox(height: 30),
          Image.asset(
            image,
            height: screenWidth * 0.5,
            width: screenWidth * 0.4,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
