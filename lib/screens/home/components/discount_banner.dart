import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenHeight * 0.02),
      padding: EdgeInsets.symmetric(
          horizontal: screenHeight * 0.06, vertical: screenWidth * 0.04),
      width: double.infinity,
      // height: screenHeight * 0.12,
      decoration: BoxDecoration(
        color: const Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text.rich(
        TextSpan(
            text: "A Winter Surprise\n",
            style: TextStyle(color: Colors.white),
            children: [
              TextSpan(
                  text: "Cashback 20%",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ))
            ]),
      ),
    );
  }
}
