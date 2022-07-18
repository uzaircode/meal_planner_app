import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailScreen(this.toggleFavourite, this.isFavourite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meal>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // buildSectionTitle(context, 'Ingredients'),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  '${meal.title}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: true,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.schedule,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        // Text('$duration min'),
                        Text('240 min'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.work,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        // Text(ComplexityText),
                        Text('Complex'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.attach_money,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        // Text(AffordabilityText),
                        Text('Affordable'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: buildContainer(
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    meal.ingredients[index],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildSectionTitle(context, 'Steps'),
                buildContainer(
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: meal.steps.length,
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              '# ${(index + 1)}',
                            ),
                          ),
                          title: Text(
                            meal.steps[index],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        // child: Column(
        //   children: <Widget>[

        // buildSectionTitle(context, 'Steps'),

        // ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourite(meal.id) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavourite(meal.id),
      ),
    );
  }
}
