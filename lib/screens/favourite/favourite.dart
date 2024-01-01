import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myshop/components/custom_navbar.dart';
import 'package:myshop/enums.dart';
import 'package:myshop/new_models/new_product.dart';
import 'package:myshop/screens/details/details_screen.dart';
import 'package:myshop/screens/home/components/all_products.dart'; // Import the NewProduct model

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  static String routerName = '/favourite';

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: const Column(
          children: [
            Text(
              "Favourites",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomNavBar(selectedMenu: MenuState.favourites),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Products')
            .where('isFavourite', isEqualTo: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          List<NewProduct> favouriteProducts =
              snapshot.data!.docs.map((DocumentSnapshot doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return NewProduct.fromJson(data);
          }).toList();

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.8,
            ),
            itemCount: favouriteProducts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, DetailsScreen.routerName,
                      arguments: ProductDetails(
                          newproducts: favouriteProducts[index]));
                },
                child: ProductTile(
                  newProduct: favouriteProducts[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
