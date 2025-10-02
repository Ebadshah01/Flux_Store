import 'package:flutter/material.dart';

class FavoriteItem with ChangeNotifier{
  final List<int> _selectedItem =[

  ];
  List<int> get selectedItem => _selectedItem;

  void addItem(int value){
    _selectedItem.add(value);
    notifyListeners();
  }
  
}