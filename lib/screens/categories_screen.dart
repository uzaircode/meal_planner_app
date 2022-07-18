import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/meal.dart';
import 'package:flutter_complete_guide/widgets/category_item.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<CategoryItem>(context);

    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(25),
        children: category.map((catData) => CategoryItem(catData.id, catData.title, catData.color)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
