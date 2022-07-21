import 'package:flutter/foundation.dart';
import '../data/meal.dart';

class Meals with ChangeNotifier {

  final List<Meal> _meals = [
    Meal(
      id: 'm1',
      categories: [
        'c3'
      ],
      title: 'New York Cheesecake',
      description: 'delicious!',
      imageUrl:
      'https://static01.nyt.com/images/2021/11/02/dining/dg-Tall-and-Creamy-Cheesecake/dg-Tall-and-Creamy-Cheesecake-articleLarge.jpg',
      duration: 30,
      ingredients: [
        'White and Green Asparagus',
        '30g Pine Nuts',
        '300g Cherry Tomatoes',
        'Salad',
        'Salt, Pepper and Olive Oil'
      ],
      steps: [
        'Wash, peel and cut the asparagus',
        'Cook in salted water',
        'Salt and pepper the asparagus',
        'Roast the pine nuts',
        'Halve the tomatoes',
        'Mix with asparagus, salad and dressing',
        'Serve with Baguette'
      ],
    ), // 1. new york cheesecake
    Meal(
      id: 'm2',
      categories: [
        'c1'
      ],
      title: 'Spaghetti Bolognese',
      description: 'delicious!',
      imageUrl:
      'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F9%2F2013%2F12%2F06%2F201304-xl-sauce-simmered-spaghetti-al-pomodoro-2000.jpg&q=60',
      duration: 30,
      ingredients: [
        'White and Green Asparagus',
        '30g Pine Nuts',
        '300g Cherry Tomatoes',
        'Salad',
        'Salt, Pepper and Olive Oil'
      ],
      steps: [
        'Wash, peel and cut the asparagus',
        'Cook in salted water',
        'Salt and pepper the asparagus',
        'Roast the pine nuts',
        'Halve the tomatoes',
        'Mix with asparagus, salad and dressing',
        'Serve with Baguette'
      ],
    ), // 2. spaghetti bolognese
    Meal(
      id: 'm3',
      categories: [
        'c2',
        'c4'
      ],
      title: 'Overnight Oat',
      description: 'delicious!',
      imageUrl:
      'https://www.acouplecooks.com/wp-content/uploads/2020/11/Overnight-Oats-021.jpg',
      duration: 30,
      ingredients: [
        'White and Green Asparagus',
        '30g Pine Nuts',
        '300g Cherry Tomatoes',
        'Salad',
        'Salt, Pepper and Olive Oil'
      ],
      steps: [
        'Wash, peel and cut the asparagus',
        'Cook in salted water',
        'Salt and pepper the asparagus',
        'Roast the pine nuts',
        'Halve the tomatoes',
        'Mix with asparagus, salad and dressing',
        'Serve with Baguette'
      ],
    ), // 3. overnight oat
    Meal(
      id: 'm4',
      categories: [
        'c1'
      ],
      title: 'Fettuccine Alfredo',
      description: 'delicious!',
      imageUrl:
      'https://cdn.loveandlemons.com/wp-content/uploads/2020/01/fettuccine-alfredo.jpg',
      duration: 30,
      ingredients: [
        'White and Green Asparagus',
        '30g Pine Nuts',
        '300g Cherry Tomatoes',
        'Salad',
        'Salt, Pepper and Olive Oil'
      ],
      steps: [
        'Wash, peel and cut the asparagus',
        'Cook in salted water',
        'Salt and pepper the asparagus',
        'Roast the pine nuts',
        'Halve the tomatoes',
        'Mix with asparagus, salad and dressing',
        'Serve with Baguette'
      ],
    ), // 4. fettuccine alfredo
    Meal(
      id: 'm5',
      categories: [
        'c2'
      ],
      title: 'Pancakes',
      description: 'delicious!',
      imageUrl:
      'https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/fluffyamericanpancak_74828_16x9.jpg',
      duration: 30,
      ingredients: [
        'White and Green Asparagus',
        '30g Pine Nuts',
        '300g Cherry Tomatoes',
        'Salad',
        'Salt, Pepper and Olive Oil'
      ],
      steps: [
        'Wash, peel and cut the asparagus',
        'Cook in salted water',
        'Salt and pepper the asparagus',
        'Roast the pine nuts',
        'Halve the tomatoes',
        'Mix with asparagus, salad and dressing',
        'Serve with Baguette'
      ],
    ), // 5. pancake
    Meal(
      id: 'm6',
      categories: [
        'c2',
        'c4'
      ],
      title: 'Air Fryer Chicken Breast',
      description: 'delicious!',
      imageUrl:
      'https://gimmedelicious.com/wp-content/uploads/2020/09/Air-Fryer-Grilled-Chicken-11.jpg',
      duration: 30,
      ingredients: [
        'White and Green Asparagus',
        '30g Pine Nuts',
        '300g Cherry Tomatoes',
        'Salad',
        'Salt, Pepper and Olive Oil'
      ],
      steps: [
        'Wash, peel and cut the asparagus',
        'Cook in salted water',
        'Salt and pepper the asparagus',
        'Roast the pine nuts',
        'Halve the tomatoes',
        'Mix with asparagus, salad and dressing',
        'Serve with Baguette'
      ],
    ), // 6. air fryer chicken breast
    Meal(
      id: 'm7',
      categories: [
        'c3'
      ],
      title: 'Strawberry Meringue Roulade',
      description: 'delicious!',
      imageUrl:
      'https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/strawberrymeringuero_74824_16x9.jpg',
      duration: 30,
      ingredients: [
        'White and Green Asparagus',
        '30g Pine Nuts',
        '300g Cherry Tomatoes',
        'Salad',
        'Salt, Pepper and Olive Oil'
      ],
      steps: [
        'Wash, peel and cut the asparagus',
        'Cook in salted water',
        'Salt and pepper the asparagus',
        'Roast the pine nuts',
        'Halve the tomatoes',
        'Mix with asparagus, salad and dressing',
        'Serve with Baguette'
      ],
    ) // 7. strawberry meringue roulade
  ];


  List<Meal> get allMeals {
    return [..._meals];
  }

  Meal findById(String id) {
    return _meals.firstWhere((category) => category.id == id);
  }

  List<Meal> matchWithCategoryId(String id) {
    return _meals.where((element) => element.categories.contains(id)).toList();
  }
}
