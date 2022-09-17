import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/meal.dart';
import '../providers/meal_provider.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const MealItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);

    final meal = Provider.of<Meal>(context);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MealDetailScreen.routeName,
          arguments: meal.id,
        );
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
                    imageUrl,
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
                          title,
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
                          // Text(meal.complexity.name.toString()),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          // Icon(
                          //   Icons.attach_money,
                          // ),
                          IconButton(
                            onPressed: () async {
                              try {
                                print('its flow');
                                print(id);
                                await Provider.of<Meals>(context, listen: false)
                                    .deleteMeal(id);
                              } catch (error) {
                                scaffold.showSnackBar(
                                  const SnackBar(
                                    content: Text('Deletion failed!'),
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          // Text(meal.affordability.name.toString()),
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
