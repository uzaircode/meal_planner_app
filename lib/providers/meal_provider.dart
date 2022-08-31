import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/meal.dart';
import 'package:http/http.dart' as http;

class Meals with ChangeNotifier {
  List<Meal> _meals = [];
  final String authToken;
  // final String userId;

  Meals(this.authToken, this._meals);

  List<Meal> get allMeals {
    return [..._meals];
  }

  Meal findById(String id) {
    return _meals.firstWhere((category) => category.id == id);
  }

  List<Meal> matchWithCategoryId(String id) {
    return _meals.where((element) => element.categories.contains(id)).toList();
  }

  Future<void> fetchMeals() async {
    final url = Uri.parse(
        'https://meal-app-a9ac5-default-rtdb.asia-southeast1.firebasedatabase.app/meals.json?auth=$authToken');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Meal> loadedMeal = [];
      extractedData.forEach((mealId, mealData) {
        loadedMeal.add(Meal(
          id: mealId,
          categories: mealData['categories'],
          title: mealData['title'],
          description: mealData['description'],
          imageUrl: mealData['imageUrl'],
          duration: mealData['duration'],
        ));
      });
      _meals = loadedMeal;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addMeal(Meal meal) async {
    final url = Uri.parse(
        'https://meal-app-a9ac5-default-rtdb.asia-southeast1.firebasedatabase.app/meals.json?auth=$authToken');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': meal.title,
          'categories': meal.categories,
          'description': meal.description,
          'imageUrl': meal.imageUrl,
          // 'creatorId': userId,
        }),
      );
      final newMeal = Meal(
        title: meal.title,
        categories: meal.categories,
        description: meal.description,
        imageUrl: meal.imageUrl,
        id: json.decode(response.body)['name'],
      );

      _meals.add(newMeal);
      notifyListeners();

      return Future.delayed(const Duration(seconds: 5));
    } catch (error) {
      debugPrint(error);
      throw error;
    }
  }
}
