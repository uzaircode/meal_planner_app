import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';

import '../providers/meal_provider.dart';
import '../widgets/meal_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var _isInit = true;

  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchProduct(); //wont work!
    Future.delayed(Duration.zero).then(
      (value) => Provider.of<Meals>(context, listen: false).fetchMeals(),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Meals>(context, listen: false).fetchMeals().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mealData = Provider.of<Meals>(context, listen: false);
    final meals = mealData.allMeals;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: meals.length,
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: meals[i],
            child: MealItem(),
          ),
        ),
      ),
    );
  }
}
