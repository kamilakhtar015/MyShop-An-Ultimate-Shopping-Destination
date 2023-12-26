import 'package:flutter/material.dart';
import 'package:myshop/routes.dart';
import 'package:myshop/screens/splash/splash_screen.dart';
import 'package:myshop/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: const SplashScreeen(),
      initialRoute: SplashScreeen.routeName,
      routes: routes,
    );
  }
}
