import 'package:flutter/material.dart';
import '../widgets/meal_grid.dart';

class CategoryOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Uzair Meal'),
      ),
      body: MealGrid()
    );
  }
}