import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/meal.dart';
import '../providers/meal_provider.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({Key key}) : super(key: key);

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final _form = GlobalKey<FormState>();

  var _addMeal = Meal(
    id: null,
    title: '',
    categories: '',
    description: '',
    imageUrl: '',
  );

  Future<void> _saveForm() async {
    try {
      _form.currentState.save();
      await Provider.of<Meals>(context, listen: false).addMeal(_addMeal);
    } catch (error) {
      debugPrint(error);
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('An error occured!'),
          content: const Text('Something when wrong.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Meal'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              //image url
              TextFormField(
                decoration: const InputDecoration(labelText: 'image URL'),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (_) => _saveForm(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Pleave provide a value!';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _addMeal = Meal(
                    id: _addMeal.id,
                    title: _addMeal.title,
                    categories: _addMeal.categories,
                    description: _addMeal.description,
                    imageUrl: value,
                  );
                },
              ),
              SizedBox(height: 30),
              //food name
              Text('Food Name'),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter food name',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(148, 157, 164, 1.0),
                    fontSize: 17,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Color.fromRGBO(234, 236, 242, 1.0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  errorBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  focusedErrorBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  errorStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => _saveForm(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Pleave provide a value!';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _addMeal = Meal(
                    id: _addMeal.id,
                    title: value,
                    categories: _addMeal.categories,
                    description: _addMeal.description,
                    imageUrl: _addMeal.imageUrl,
                  );
                },
              ),
              SizedBox(height: 30),
              //description
              Text('Description'),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tell a little about your food',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(148, 157, 164, 1.0),
                    fontSize: 17,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Color.fromRGBO(234, 236, 242, 1.0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  errorBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  focusedErrorBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  errorStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => _saveForm(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Pleave provide a value!';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _addMeal = Meal(
                    id: _addMeal.id,
                    title: _addMeal.title,
                    categories: _addMeal.categories,
                    description: value,
                    imageUrl: _addMeal.imageUrl,
                  );
                },
              ),
              SizedBox(height: 30),
              //categories
              Text('Categories'),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Categories'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (_) => _saveForm(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Pleave provide a value!';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _addMeal = Meal(
                    id: _addMeal.id,
                    title: _addMeal.title,
                    categories: value,
                    description: _addMeal.description,
                    imageUrl: _addMeal.imageUrl,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
