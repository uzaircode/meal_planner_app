import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

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
        color: Color.fromRGBO(1, 115, 112, 1.0),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      //use didChangeDependencies() because we have context
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealID) {
  //   setState(
  //     () {
  //       displayedMeals.removeWhere((meal) => meal.id == mealID);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 90.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                categoryTitle,
                style: TextStyle(color: Colors.black),
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
                  children: [_buildInkWell('Filter',Icon(Icons.filter_alt, color: Colors.white)), SizedBox(width: 20), _buildInkWell('Sorting',Icon(Icons.sort, color: Colors.white))],
                ),
                Container(
                  child: ListView.builder(
                    padding: EdgeInsets.all(8),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: displayedMeals.length,
                    itemBuilder: (ctx, index) {
                      return MealItem(
                        id: displayedMeals[index].id,
                        title: displayedMeals[index].title,
                        imageURL: displayedMeals[index].imageUrl,
                        duration: displayedMeals[index].duration,
                        complexity: displayedMeals[index].complexity,
                        affordability: displayedMeals[index].affordability,
                      );
                    },
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