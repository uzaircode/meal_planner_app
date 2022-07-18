import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = '/setting';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return Card(
      color: Colors.white,
      child: SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(subtitle),
        onChanged: updateValue,
      ),
    );
  }

  Widget _buildClickableListTile(String title) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
        selectedTileColor: Colors.white,
        // onTap: nextPage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Filter'),
                      _buildSwitchListTile(
                        'Gluten Free',
                        'Only include gluten free meal',
                        _glutenFree,
                        (newValue) {
                          setState(
                            () {
                              _glutenFree = newValue;
                            },
                          );
                        },
                      ),
                      _buildSwitchListTile(
                        'Lactose Free',
                        'Only include lactose free meal',
                        _lactoseFree,
                        (newValue) {
                          setState(
                            () {
                              _lactoseFree = newValue;
                            },
                          );
                        },
                      ),
                      _buildSwitchListTile(
                        'Vegetarian',
                        'Only include vegetarian meals',
                        _vegetarian,
                        (newValue) {
                          setState(
                            () {
                              _vegetarian = newValue;
                            },
                          );
                        },
                      ),
                      _buildSwitchListTile(
                        'Vegan',
                        'Only include vegan meals',
                        _vegan,
                        (newValue) {
                          setState(
                            () {
                              _vegan = newValue;
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Other'),
                      _buildClickableListTile(
                        'Feedback',
                      ),
                      _buildClickableListTile(
                        'Feedback',
                      ),
                      _buildClickableListTile(
                        'Feedback',
                      ),
                      _buildClickableListTile(
                        'Feedback',
                      ),
                    ],
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
