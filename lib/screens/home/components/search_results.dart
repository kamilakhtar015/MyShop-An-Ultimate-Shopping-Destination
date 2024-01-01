import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:myshop/constants.dart';
import 'package:myshop/new_models/new_product.dart';
import 'package:myshop/screens/details/details_screen.dart';
import 'package:myshop/screens/home/components/all_products.dart';

class SearchResults extends StatelessWidget {
  final String searchText;

  const SearchResults({Key? key, required this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results for "$searchText"'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Products').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          List<NewProduct> searchResults =
              snapshot.data!.docs.map((DocumentSnapshot doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return NewProduct.fromJson(data);
          }).where((product) =>
              product.title.toLowerCase().contains(searchText.toLowerCase())).toList();

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.8,
            ),
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, DetailsScreen.routerName,
                      arguments: ProductDetails(newproducts: searchResults[index]));
                },
                child: ProductTile(
                  newProduct: searchResults[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
