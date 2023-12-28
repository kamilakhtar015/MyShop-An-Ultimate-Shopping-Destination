import 'package:flutter/material.dart';
import 'package:myshop/constants.dart';
import 'package:myshop/new_models/new_product.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    super.key,
    required this.screenWidth,
    required this.newproducts,
    // required NewProduct newproduct,
  });

  final double screenWidth;
  final NewProduct newproducts;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: widget.screenWidth * 0.5,
          height: widget.screenWidth * 0.5,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              widget.newproducts.images[selectedImage],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.newproducts.images.length,
                (index) => smallPreview(index))
          ],
        )
      ],
    );
  }

  GestureDetector smallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: widget.screenWidth * 0.06),
        padding: EdgeInsets.all(widget.screenWidth * 0.01),
        height: widget.screenWidth * 0.15,
        width: widget.screenWidth * 0.15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedImage == index ? kPrimaryColor : Colors.transparent,
          ),
        ),
        child: Image.network(widget.newproducts.images[index]),
      ),
    );
  }
}
