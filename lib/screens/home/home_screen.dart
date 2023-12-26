import 'package:flutter/material.dart';
import 'package:myshop/components/custom_navbar.dart';
import 'package:myshop/enums.dart';
import 'package:myshop/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomNavBar(selectedMenu: MenuState.home),
    );
  }
}
