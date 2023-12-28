// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myshop/firebase_options.dart';
import 'package:myshop/routes.dart';
import 'package:myshop/screens/splash/splash_screen.dart';
import 'package:myshop/theme.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
      // home: ProductListScreen(),
    );
  }
}

// class ProductListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('Products').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           // If there's no error and data is available, build the product list
//           List<Product> products = snapshot.data!.docs.map((doc) {
//             return Product.fromDocumentSnapshot(doc);
//           }).toList();

//           return ListView.builder(
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(products[index].title),
//                 subtitle: Text(products[index].description),
//                 trailing: Text('\$${products[index].price.toString()}'),
//                 // leading: Row(
//                 //   children: products[index].images.map((imageUrl) {
//                 //     return Padding(
//                 //       padding: const EdgeInsets.all(8.0),
//                 //       child: Image.network(
//                 //         imageUrl,
//                 //         width: 400,
//                 //         height: 100,
//                 //         fit: BoxFit.cover,
//                 //         errorBuilder: (context, error, stackTrace) {
//                 //           print('Error loading image: $error');
//                 //           return Text('Error loading image');
//                 //         },
//                 //       ),
//                 //     );
//                 //   }).toList(),
//                 // ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

// //   Future<String?> _loadImage(String imagePath) async {
// //     try {
// //       final ref = FirebaseStorage.instance.ref().child(imagePath);
// //       final url = await ref.getDownloadURL();
// //       return url;
// //     } catch (e) {
// //       print('Error loading image: $e');
// //       return null;
// //     }
// //   }
// }

// class Product {
//   final String id;
//   final List<String> images;
//   final String title;
//   final String description;
//   final double rating;
//   final double price;

//   Product({
//     required this.id,
//     required this.images,
//     required this.title,
//     required this.description,
//     required this.rating,
//     required this.price,
//   });

//   // Create a Product object from a Firestore document
//   factory Product.fromDocumentSnapshot(DocumentSnapshot snapshot) {
//     Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

//     // Explicitly cast to List<dynamic> and then convert to List<String>
//     List<String> imageList = List<String>.from(
//         (data['images'] as List<dynamic>).map((e) => e.toString()));

//     return Product(
//       id: snapshot.id,
//       images: imageList,
//       title: data['title'],
//       description: data['description'],
//       rating: data['rating'],
//       price: data['price'],
//     );
//   }
// }
