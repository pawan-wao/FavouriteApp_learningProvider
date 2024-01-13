import 'package:flutter/material.dart';
import 'package:favouriteapp_learningprovider/home_page.dart';


class FavProvider with ChangeNotifier{
  List<int> _selectedItems = [];

 List<int> get selectedItems => _selectedItems;

 void heartLiked (int index){
   _selectedItems.add(index);
   notifyListeners();
 }

  void heartremove (int index){
    _selectedItems.remove(index);
    notifyListeners();
  }

}

