import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myshop/firebase_options.dart';
import 'package:myshop/models/product_model.dart';
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

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Products').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // If there's no error and data is available, build the product list
          List<Product> products = snapshot.data!.docs.map((doc) {
            return Product.fromDocumentSnapshot(doc);
          }).toList();

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(products[index].title),
                subtitle: Text(products[index].description),
                trailing: Text('\$${products[index].price.toString()}'),
                leading: FutureBuilder<Uint8List?>(
                  future: _loadImage(products[index].images),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data != null) {
                        return Image.memory(snapshot.data!);
                      } else {
                        return Text('Image not found');
                      }
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<Uint8List?> _loadImage(String imageUrl) async {
    try {
      final ref = FirebaseStorage.instance.refFromURL(imageUrl);
      final data = await ref.getData();
      return data;
    } catch (e) {
      print('Error loading image: $e');
      return null;
    }
  }
}

class Product {
  final String id;
  final String images;
  final String title;
  final String description;
  final double rating;
  final double price;

  Product({
    required this.id,
    required this.images,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
  });

  // Create a Product object from a Firestore document
  factory Product.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Product(
      id: snapshot.id,
      images: data['images'],
      title: data['title'],
      description: data['description'],
      rating: data['rating'],
      price: data['price'],
    );
  }
}
