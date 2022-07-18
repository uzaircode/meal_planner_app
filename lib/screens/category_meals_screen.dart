import 'package:flutter/material.dart';
import '../providers/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

Widget _buildInkWell(String title, Icon icon) {
  return InkWell(
    onTap: () {},
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
  static List<Meal> _foundMeal;

  @override
  void initState() {
    _foundMeal = displayedMeals;
    super.initState();
  }

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
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Search recipe',
                      focusColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildInkWell(
                        'Filter',
                        Icon(
                          Icons.filter_alt,
                          color: Colors.white,
                        )),
                    SizedBox(width: 20),
                    _buildInkWell(
                        'Sorting', Icon(Icons.sort, color: Colors.white))
                  ],
                ),
                Container(
                  child: _foundMeal.isNotEmpty
                      ? ListView.builder(
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
                              affordability:
                                  displayedMeals[index].affordability,
                            );
                          },
                        )
                      : const Text(
                          'No results found',
                          style: TextStyle(fontSize: 24),
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
