import 'package:flutter/material.dart';
import 'package:myshop/constants.dart';
import 'package:myshop/models/product.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    super.key,
    required this.screenWidth,
    required this.product,
  });

  final double screenWidth;
  final Product product;

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
            child: Image.asset(widget.product.images[selectedImage]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                widget.product.images.length, (index) => smallPreview(index))
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
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}
