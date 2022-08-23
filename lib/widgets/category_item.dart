import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/category_detail_screen.dart';
import 'package:provider/provider.dart';
import '../data/category.dart';
import '../providers/category_provider.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<CategoryItems>(context, listen: false);

    return InkWell(
      onTap: () {
        print(category.id);
        Navigator.pushNamed(
          context,
          CategoryDetailScreen.routeName,
          arguments: category.id,
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
