import 'package:flutter/material.dart';
import 'package:myshop/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key, // Use 'Key? key' instead of 'super.key'
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
    // double screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        // width: screenWidth * 0.4,
        // height: screenWidth * 0.08,
        width: 300,
        height: 48,
        child: ElevatedButton(
          onPressed: () => press(), // Corrected onPressed syntax
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              // fontSize: getProportionateScreenHeight(16),
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
