import 'package:flutter/material.dart';
import 'package:myshop/new_models/new_product.dart';
import 'package:myshop/screens/details/components/body.dart';
import 'package:myshop/screens/details/components/custome_appbar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static String routerName = '/details';

  @override
  Widget build(BuildContext context) {

    final ProductDetails arguments = ModalRoute.of(context)!.settings.arguments as ProductDetails;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: arguments.newproducts.rating),
      body: Body(newproducts: arguments.newproducts),
    );
  }
}

class ProductDetails {
  late final NewProduct newproducts;
  ProductDetails({required this.newproducts});
}
