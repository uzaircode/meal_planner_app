import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious
}

class Meal with ChangeNotifier {
  final String id;
  final String title;
  final List<String> categories;
  final String description;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final List<String> ingredients;
  final List<String> steps;

  Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.ingredients,
    @required this.steps,
  });
}
