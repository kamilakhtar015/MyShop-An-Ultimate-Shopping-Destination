import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.screenWidth,
    required this.text,
    required this.press,
  });

  final double screenWidth;

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: press,
            child: const Text("See More"),
          )
        ],
      ),
    );
  }
}
