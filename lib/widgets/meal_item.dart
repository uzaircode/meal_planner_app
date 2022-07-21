import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meal>(context);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MealDetailScreen.routeName, arguments: meal.id);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          meal.title,
                          softWrap: true,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.schedule,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(meal.duration.toString()),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.work,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(meal.complexity.name.toString()),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.attach_money,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(meal.affordability.name.toString()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
