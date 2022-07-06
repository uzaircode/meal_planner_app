import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

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
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
              print(selectedFilters);
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
