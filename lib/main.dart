import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/meal.dart';
import 'package:flutter_complete_guide/screens/setting_screen.dart';
import 'package:provider/provider.dart';
import 'color/palette.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Meal(),
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
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
              ),
        ),
        home: SettingScreen(),
        initialRoute: '/',
        //default is '/'
        routes: {
          SettingScreen.routeName: (ctx) => SettingScreen()
        },
      ),
    );
  }
}
