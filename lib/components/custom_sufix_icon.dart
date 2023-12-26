import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSufixIcon extends StatelessWidget {
  const CustomSufixIcon({
    super.key,
    required this.svgIcon,
  });

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.0, // Adjust the width to your desired size
      height: 24.0, // Adjust the height to your desired size
      child: Container(
        padding: const EdgeInsets.all(8), // Adjust the padding as needed
        child: SvgPicture.asset(svgIcon),
      ),
    );
  }
}
