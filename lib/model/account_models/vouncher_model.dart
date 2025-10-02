import 'package:flutter/material.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

class VouncherItems {
  final Color color;
  final String title;
  final String date;
  final String discount;
  final String code;

  VouncherItems({
    required this.color,
    required this.title,
    required this.date,
    required this.discount,
    required this.code,
  });
}

// Sample data
final List<VouncherItems> vouncherlist = [
  VouncherItems(
    color: blackthemecolor,
    title: "Black Friday",
    date: "20\ndec",
    discount: "50%",
    code: "Code: fridaysale",
  ),
  VouncherItems(
    color: Colors.black45,
    title: "Holiday Sale",
    date: "10\nsep",
    discount: "30%",
    code: "Code: holiday30",
  ),
  VouncherItems(
    color: Colors.black26,
    title: "First order",
    date: "12\nsep",
    discount: "20%",
    code: "Code: welcome",
  ),
];
