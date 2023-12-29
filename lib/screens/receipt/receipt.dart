import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myshop/new_models/new_cart_item.dart';

class Receipt extends StatefulWidget {
  const Receipt({super.key});

  @override
  State<Receipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer(builder: (context, ref, child) {
          final cart = ref.watch(cartProvider);
          print(cart.cartItems);
          return Text('"data"');
        }),
      ),
    );
  }
}
