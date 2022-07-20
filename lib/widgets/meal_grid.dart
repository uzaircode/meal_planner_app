import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/category_provider.dart';
import 'package:flutter_complete_guide/providers/meal_provider.dart';
import 'package:provider/provider.dart';
import 'category_item.dart';

class MealGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoryMeal>(context);
    final category = categoryData.allCategories;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: category.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: category[i],
        child: CategoryItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
