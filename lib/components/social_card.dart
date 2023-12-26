import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    super.key,
    required this.screenHeight,
    required this.icon,
    required this.press,
  });

  final double screenHeight;
  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.2,
      decoration: const BoxDecoration(
        color: Color(0xFFF5F6F9),
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
