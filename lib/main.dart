import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/data/category.dart';
import 'package:flutter_complete_guide/providers/category_provider.dart';
import 'package:flutter_complete_guide/providers/meal_provider.dart';
import 'package:flutter_complete_guide/screens/category_detail_screen.dart';
import 'package:flutter_complete_guide/screens/category_overview_screen.dart';
import 'package:flutter_complete_guide/widgets/category_item.dart';
import 'package:provider/provider.dart';
import 'color/palette.dart';
import 'data/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Meals(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CategoryMeal(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Meal(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CategoryItems(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Uzair Meal',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Palette.kToDark)
              .copyWith(secondary: Colors.amber),
          canvasColor: Color.fromRGBO(247, 243, 239, 1),
          primaryColor: Color.fromRGBO(4, 38, 40, 1.0),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(247, 247, 247, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(247, 247, 247, 1),
                ),
              ),
        ),
        home: CategoryOverviewScreen(),
        initialRoute: '/',
        //default is '/'
        routes: {
          CategoryDetailScreen.routeName: (ctx) => CategoryDetailScreen(),
        },
      ),
    );
  }
}
