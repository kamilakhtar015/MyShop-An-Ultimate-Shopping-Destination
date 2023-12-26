import 'package:flutter/material.dart';
import 'package:myshop/components/default_button.dart';
import 'package:myshop/constants.dart';
import 'package:myshop/screens/sign_in/sign_in_screen.dart';
import 'package:myshop/screens/splash/components/splash_content.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _BodyState();
}

class _BodyState extends State<SplashBody> {
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

    return Column(
      children: [
        const SizedBox(height: 50),
        Expanded(
          flex: 3,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: splashData.length,
            itemBuilder: (context, index) => SplashContent(
              image: splashData[index]["image"] ?? "",
              text: splashData[index]["text"] ?? "",
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                splashData.length,
                (index) => buildDot(index: index),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        DefaultButton(
          text: "Continue",
          width: 300,
          height: 48,
          press: () {
            Navigator.pushNamed(context, SignInScreen.routeName);
          },
        ),
      ],
    );
  }

  Column buildDot({required int index}) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 6,
          width: currentPage == index ? screenWidth * 0.07 : screenWidth * 0.02,
          decoration: BoxDecoration(
            color:
                currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
            borderRadius: BorderRadius.circular(3),
          ),
        )
      ],
    );
  }
}
