
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myshop/constants.dart';
import 'package:myshop/models/cart.dart';
import 'package:myshop/screens/cart/components/body.dart';
import 'package:myshop/size_config.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              // "4 Items",
              "${demoCarts.length} items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: const Body(),
      bottomNavigationBar: const CheckOurCard(),
    );
  }
}

class CheckOurCard extends StatelessWidget {
  const CheckOurCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.screenWidth * 0.02,
        horizontal: SizeConfig.defaultSize * 0.04,
      ),
      height: 174,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -15),
                blurRadius: 20,
                color: const Color(0xFFDADADA).withOpacity(0.15))
          ]),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: SizeConfig.screenWidth * 0.04,
            width: SizeConfig.screenWidth * 0.04,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset("assets/icons/receipt.svg"),
          ),
          const Spacer(),
          const Text('Add voucher code'),
          const SizedBox(width: 10),
          const Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: kTextColor,
          )
        ],
      ),
    );
  }
}
