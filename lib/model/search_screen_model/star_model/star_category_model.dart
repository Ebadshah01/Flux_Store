import 'package:flutter/material.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

class StarCategoryModel {
  final String rating;
  StarCategoryModel({required this.rating});
}

final List<StarCategoryModel> starCategoryModellist = [
  StarCategoryModel(rating: "1"),
  StarCategoryModel(rating: "2"),
  StarCategoryModel(rating: "3"),
  StarCategoryModel(rating: "4"),
  StarCategoryModel(rating: "5"),
];

class StarRatingCategory extends StatefulWidget {
  const StarRatingCategory({super.key});

  @override
  State<StarRatingCategory> createState() => _StarRatingCategoryState();
}

class _StarRatingCategoryState extends State<StarRatingCategory> {
  int selectedIndex = -1; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitethemecolor,
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: starCategoryModellist.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
      
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: isSelected ? blackthemecolor : whitethemecolor,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 1,
                  color: isSelected ?whitethemecolor : blackthemecolor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 15,
                    color: isSelected ? whitethemecolor : blackthemecolor,
                  ),
                  SizedBox(width: 3),
                  Text(
                    starCategoryModellist[index].rating,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? whitethemecolor : blackthemecolor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
