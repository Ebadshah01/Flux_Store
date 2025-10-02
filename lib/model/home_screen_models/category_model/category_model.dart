import 'package:flutter/material.dart';

class CategoryModel {
  final IconData icon;
  final String title;

  CategoryModel({
    required this.icon,
     required this.title});
}

final List<CategoryModel>categoryModellist = [
  CategoryModel(icon: Icons.female, title: "Women"),
  CategoryModel(icon: Icons.male, title: "Men"),
  CategoryModel(icon: Icons.watch_outlined, title: "Accessories"),
  CategoryModel(icon: Icons.add_shopping_cart_rounded, title: "Beauty"),
 // CategoryModel(icon: Icons., title: title)

];