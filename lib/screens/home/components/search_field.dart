import 'package:flutter/material.dart';
import 'package:myshop/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.6,
      height: screenHeight * 0.08,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        // Search for the specific product
        onChanged: (value) {},
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Search Product",
            prefixIcon: const Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02,
              vertical: screenHeight * 0.02,
            )),
      ),
    );
  }
}