import 'package:flutter/material.dart';
import 'package:myshop/components/default_button.dart';
import 'package:myshop/screens/home/home_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: screenHeight * 0.1),
        Image.asset("assets/images/success.png"),
        SizedBox(height: screenHeight * 0.1),
        const Text(
          "Login Succesfully",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: screenWidth * 0.5,
          child: DefaultButton(
            text: "Back to Home",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
                        width: 300,
            height: 48,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
