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

  // @override
  // void initState() {
  //   // Provider.of<Products>(context).fetchProduct(); //wont work!
  //   Future.delayed(Duration.zero).then(
  //     (value) => Provider.of<Meals>(context, listen: false).fetchMeals(true),
  //   );
  //   super.initState();
  // }

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<Meals>(context, listen: false).fetchMeals().then((_) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Future<void> _refreshMeal(BuildContext context) async {
      await Provider.of<Meals>(context, listen: false).fetchMeals(true);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : RefreshIndicator(
              onRefresh: () => _refreshMeal(context),
              child: Consumer<Meals>(
                builder: (ctx, productsData, _) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: productsData.allMeals.length,
                    itemBuilder: (_, i) => Column(
                      children: [
                        MealItem(
                          productsData.allMeals[i].id,
                          productsData.allMeals[i].title,
                          productsData.allMeals[i].imageUrl,
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
