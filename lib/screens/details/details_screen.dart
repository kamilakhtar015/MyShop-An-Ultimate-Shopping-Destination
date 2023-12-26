import 'package:flutter/material.dart';
import 'package:myshop/models/product.dart';
import 'package:myshop/screens/details/components/body.dart';
import 'package:myshop/screens/details/components/custome_appbar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static String routerName = '/details';

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;

    final ProductDetails arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetails;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: arguments.product.rating),
      body: Body(product: arguments.product),
    );
  }
}

class ProductDetails {
  late final Product product;
  ProductDetails({required this.product});
}
