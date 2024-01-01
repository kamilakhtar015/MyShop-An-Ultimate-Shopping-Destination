import 'package:flutter/material.dart';
import 'package:myshop/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String text;
  final Function press;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: screenWidth * width,
        height: screenWidth * height,
        child: ElevatedButton(
          onPressed: () => press(),
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Center(
            // Center widget added here
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
