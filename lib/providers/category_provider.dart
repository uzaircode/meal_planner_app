import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/category.dart';

class CategoryMeal with ChangeNotifier {
  final List<CategoryItems> _categories = [
    CategoryItems(
      id: 'c1',
      title: 'Italian',
    ), //italian
    CategoryItems(
      id: 'c2',
      title: 'Quick and Easy',
    ), //quick and easy
    CategoryItems(
      id: 'c3',
      title: 'Dessert',
    ), //dessert
    CategoryItems(
      id: 'c4',
      title: 'Healthy Choice',
    ) //healthy choice
  ];

  List<CategoryItems> get allCategories {
    return [..._categories];
  }

  CategoryItems findById(String id) {
    return _categories.firstWhere((category) => category.id == id);
  }
}
