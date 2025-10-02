import 'package:flutter/material.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

class ColorCategoryModel {
  final Color color;
  ColorCategoryModel({required this.color});
}

final List<ColorCategoryModel> colorCategoryModellist = [
  ColorCategoryModel(color: orangethemecolor),
  ColorCategoryModel(color: pinkthemecolor),
  ColorCategoryModel(color: redthemecolor),
  ColorCategoryModel(color: blackthemecolor),
  ColorCategoryModel(color: greythemecolor),
  ColorCategoryModel(color: yellowthemecolor),
  ColorCategoryModel(color: bluethemecolor),

  //  ColorCategoryModel(color: greenthemecolor),
];
