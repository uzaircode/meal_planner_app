import 'package:flutter/foundation.dart';

class Meal with ChangeNotifier {
  final String id;
  final String title;
  final List<String> categories;
  final String description;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;

  Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.duration,
    @required this.ingredients,
    @required this.steps,
  });
}
