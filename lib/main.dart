import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/login_screen.dart';
import 'package:flutter_complete_guide/screens/signup_screen.dart';
import 'package:flutter_complete_guide/screens/splash_screen.dart';
import '../data/category.dart';
import '../providers/auth.dart';
import '../providers/category_provider.dart';
import '../providers/meal_provider.dart';
import '../screens/auth_screen.dart';
import '../screens/category_detail_screen.dart';
import '../screens/homepage_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/tabs_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'data/meal.dart';

void main() => runApp(MyApp());

//remove scroll glow logic
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //auth provider must be on top!
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Meals>(
          create: (ctx) => Meals('', '', []),
          update: (ctx, auth, previousProduct) => Meals(
            auth.token,
            auth.userId,
            previousProduct == null ? [] : previousProduct.allMeals,
          ),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CategoryMeal(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Meal(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CategoryItems(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          //remove scroll grow
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: child,
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'Uzair Meal',
          theme: ThemeData(
            textTheme: GoogleFonts.interTextTheme(
              ThemeData.light().textTheme.copyWith(
                    bodyText1: TextStyle(
                      color: Color.fromRGBO(4, 38, 40, 1.0),
                    ),
                    bodyText2: TextStyle(
                      color: Color.fromRGBO(4, 38, 40, 1.0),
                    ),
                  ),
            ),
            colorScheme:
                ThemeData().colorScheme.copyWith(primary: Colors.black),
            primaryColor: Color.fromRGBO(4, 38, 40, 1.0),
          ),
          home: auth.isAuth
              ? TabsScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          initialRoute: '/',
          routes: {
            CategoryDetailScreen.routeName: (ctx) => CategoryDetailScreen(),
            MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
            TabsScreen.routeName: (ctx) => TabsScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            SignUpScreen.routeName: (ctx) => SignUpScreen(),
          },
        ),
      ),
    );
  }
}
