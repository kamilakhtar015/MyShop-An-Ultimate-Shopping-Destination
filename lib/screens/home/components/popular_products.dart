import 'package:flutter/material.dart';
import 'package:myshop/components/product_card.dart';
import 'package:myshop/models/product.dart';
import 'package:myshop/screens/details/details_screen.dart';
import 'package:myshop/screens/home/components/section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          screenWidth: screenWidth,
          text: "Popular Product",
          press: () {},
        ),
        SizedBox(height: screenHeight * 0.02),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) => ProductCard(
                  screenWidth: screenWidth,
                  product: demoProducts[index],
                  press: () => Navigator.pushNamed(
                      context, DetailsScreen.routerName,
                      arguments: ProductDetails(product: demoProducts[index])),
                ),
              ),
              SizedBox(width: screenHeight * 0.02)
            ],
          ),
        ),
      ],
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Product {
//   String id;
//   String title;
//   double price;
//   String color;
//   String imageUrl;

//   Product({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.color,
//     required this.imageUrl,
//   });

//   // Factory constructor to create Product objects from Firestore snapshots
//   factory Product.fromFirestore(DocumentSnapshot doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//     return Product(
//       id: doc.id,
//       title: data['title'],
//       price: data['price'].toDouble(),
//       color: data['color'],
//       imageUrl: data['imageUrl'],
//     );
//   }
// }

// Future<List<Product>> fetchProducts() async {
//   final productsCollection = FirebaseFirestore.instance.collection('Products');
//   final querySnapshot = await productsCollection.get();
//   return querySnapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
// }

// class ProductListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Products'),
//       ),
//       body: FutureBuilder<List<Product>>(
//         future: fetchProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 Product product = snapshot.data![index];
//                 return ProductCard(product: product);
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final Product product;

//   const ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         children: [
//           if (product.imageUrl != null)
//             Image.network(
//                 product.imageUrl), // Only display if imageUrl is not Null
//           Text(product.title),
//           Text('Price: \$${product.price}'),
//           Text('Color: ${product.color}'),
//         ],
//       ),
//     );
//   }
// }
