import 'package:flutter/material.dart';

class Favorites extends ChangeNotifier {
  final List<int> _favoritesItems = [];

  List<int> get items => _favoritesItems;

  void add(int itemNro) {
    _favoritesItems.add(itemNro);
    notifyListeners();
  }

  void remove(int itemNro) {
    _favoritesItems.remove(itemNro);
    notifyListeners();
  }
}
