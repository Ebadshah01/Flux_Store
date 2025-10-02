import 'package:flutter/material.dart';

class AddressModel {
  final String title;
 final IconData icon;


  AddressModel({
    required this.title,
     required this.icon,
     
  });
  
}

final List<AddressModel>addresslist = [

  AddressModel(title: "My Office", icon: Icons.maps_home_work_outlined)
,AddressModel(title: "My Home", icon: Icons.home_rounded)

];