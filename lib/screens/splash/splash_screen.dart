import 'package:flutter/material.dart';
import 'package:myshop/screens/splash/components/splash_body.dart';
// import 'package:myshop/size_config.dart';

class SplashScreeen extends StatelessWidget {
  const SplashScreeen({super.key});

  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // Have to call it on our starting screen
    // SizeConfig.init(context);
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
