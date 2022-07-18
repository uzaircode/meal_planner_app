import 'package:flutter/material.dart';

import '../screens/setting_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, Function tapHandler) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: tapHandler,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              //no back button -> example login
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Filter',
            Icons.settings,
            () {
              //no back button -> example login
              Navigator.of(context)
                  .pushReplacementNamed(SettingScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
