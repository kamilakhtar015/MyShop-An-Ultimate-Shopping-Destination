import 'package:flutter/material.dart';

// import '../constants.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key? key,
    required this.press,
    required this.iconData,
  }) : super(key: key);

  // final IconData icon;
  // final GestureTapCancelCallback press;
  // final bool showShadow;

  final IconData iconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenWidth * 0.1,
      width: screenWidth * 0.1,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Colors.white,
        ),
        child: Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
}
