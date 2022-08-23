import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/category_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/category_provider.dart';
import '../widgets/category_item.dart';
import '../widgets/meal_grid.dart';

class HomepageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoryMeal>(context);
    final category = categoryData.allCategories;

    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Uzair! 👋',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'What do you want to cook today?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                          'https://media-exp1.licdn.com/dms/image/C4D03AQGiofPSPpBDiA/profile-displayphoto-shrink_400_400/0/1642577859915?e=1666828800&v=beta&t=LdNUXykj5clCXbcyy3JKcrfdeCg2ZbQwzL7idLteKZk',
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Category'),
                          Text('See All'),
                        ],
                      ),
                      SizedBox(
                        height: 90,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          padding: EdgeInsets.all(10.0),
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25.0,
                                      backgroundImage: NetworkImage(
                                        'https://img.icons8.com/color/452/cherry-cheesecake.png',
                                      ),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    Text('Food'),
                                  ],
                                ),
                                SizedBox(width: 30),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Popular Recipes'),
                          Text('See All'),
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          padding: EdgeInsets.all(10.0),
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: Container(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                SizedBox(width: 10),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                MealGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
