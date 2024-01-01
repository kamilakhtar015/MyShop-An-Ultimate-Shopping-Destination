import 'package:flutter/material.dart';
import 'package:myshop/components/default_button.dart';
import 'package:myshop/constants.dart';
import 'package:myshop/screens/sign_in/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _LetsSpalashState();
}

class _LetsSpalashState extends State<SplashScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "An Ultimate Shopping Experience, Let's shop",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We help people connect with stores",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Shopping is fun and let's do it",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, screenWidth * 0.1, 0, 0),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'MyShop',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.08),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: screenWidth * 1.2,
                  width: screenWidth * 0.7,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Text(
                          splashData[index]['text']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                        const SizedBox(height: 30),
                        Image.asset(splashData[index]["image"]!),
                        const SizedBox(height: 10),
                        dots(screenWidth),
                      ],
                    ),
                  ),
                ),
                DefaultButton(
                  text: "Continue",
                  width: 0.6,
                  height: 0.12,
                  press: () {
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align dots(double screenWidth) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.01, // Adjusted padding
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            splashData.length,
            (index) => Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 6,
                  width: currentPage == index
                      ? screenWidth * 0.07
                      : screenWidth * 0.02,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? kPrimaryColor
                        : const Color(0xFFD8D8D8),
                    borderRadius: BorderRadius.circular(3),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
