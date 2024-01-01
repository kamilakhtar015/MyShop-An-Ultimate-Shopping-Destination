import 'package:flutter/material.dart';
import 'package:myshop/constants.dart';
import 'package:myshop/screens/home/components/search_results.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth * 0.6,
      height: widget.screenHeight * 0.08,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
          onChanged: (value) {
            setState(() {
              searchText = value;
            });
          },
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Search Product",
            prefixIcon: const Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(
              horizontal: widget.screenWidth * 0.02,
              vertical: widget.screenHeight * 0.02,
            ),
          ),
          onSubmitted: (value) {
            if (value.length > 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchResults(searchText: value),
                ),
              );
            }
          }),
    );
  }
}
