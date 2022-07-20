import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {

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
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text('${selectedMeal.title}'),
              background: Image.network(
                'd'
                // selectedMeal.imageUrl,
                // fit: BoxFit.cover,
              ),
            ),
          ),
          // buildSectionTitle(context, 'Ingredients'),
          SliverToBoxAdapter(
            child: buildContainer(
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    'd'
                    // selectedMeal.ingredients[index],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Expanded(
              child: buildContainer(
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '# ${(index + 1)}',
                          ),
                        ),
                        title: Text(
                          'd'
                          // selectedMeal.steps[index],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
        // child: Column(
        //   children: <Widget>[

        // buildSectionTitle(context, 'Steps'),

        // ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     isFavourite(mealId) ? Icons.star : Icons.star_border,
      //   ),
      //   onPressed: () => toggleFavourite(mealId),
      // ),
    );
  }
}