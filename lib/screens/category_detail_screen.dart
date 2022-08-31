import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/category_provider.dart';
import 'package:provider/provider.dart';

import '../data/meal.dart';
import '../providers/meal_provider.dart';
import '../widgets/meal_item.dart';

class CategoryDetailScreen extends StatefulWidget {
  static const routeName = '/category-detail';

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  Widget _buildInkWell(String title, Icon icon) {
    return InkWell(
      onTap: () {
        print('hello');
      },
      child: Container(
        width: 150,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(4, 38, 40, 1.0),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
  // final categoryId = ModalRoute.of(context).settings.arguments as String;
  // final displayCategory =
  //     Provider.of<CategoryMeal>(context).findById(categoryId);
  // final categoriesMeals = Provider.of<Meals>(context).fetchMeals();

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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 90.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                // displayCategory.title,
                'test',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              centerTitle: true,
            ),
            floating: true,
            backgroundColor: Color.fromRGBO(247, 243, 239, 1),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // InkWell(
                    //   onTap: () {
                    //     // print('product id : ' + categoryId);
                    //     // print(categoriesMeals);
                    //   },
                    //   child: Container(
                    //     width: 150,
                    //     height: 50,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         SizedBox(width: 10),
                    //         Text(
                    //           'Filtering',
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 18,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     decoration: BoxDecoration(
                    //       color: Color.fromRGBO(1, 115, 112, 1.0),
                    //       borderRadius: BorderRadius.circular(15),
                    //     ),
                    //   ),
                    // ),
                    _buildInkWell(
                      'Filter',
                      Icon(Icons.filter_alt, color: Colors.white),
                    ),
                    SizedBox(width: 20),
                    _buildInkWell(
                      'Sorting',
                      Icon(Icons.sort, color: Colors.white),
                    )
                  ],
                ),
                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.all(8),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: meals.length,
                        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                          value: meals[i],
                          child: MealItem(),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
