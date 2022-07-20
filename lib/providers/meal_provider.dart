import 'package:flutter/foundation.dart';
import '../data/meal.dart';

class Meals with ChangeNotifier {

  final List<Meal> _meals = [
    Meal(
      id: 'm1',
      categories: [
        'c1',
        'c2'
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
    ),
    Meal(
      id: 'm2',
      categories: [
        'c1',
        'c2'
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
    ),
    Meal(
      id: 'm3',
      categories: [
        'c1',
        'c2'
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
    ),
    Meal(
      id: 'm4',
      categories: [
        'c2'
      ],
      title: 'test',
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
    ),
    Meal(
      id: 'm5',
      categories: [
        'c1'
      ],
      title: 'working?',
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
    ),
    Meal(
      id: 'm6',
      categories: [
        'c1'
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
    )
  ];

  List<Meal> get allMeals {
    return [..._meals];
  }

  Meal findById(String id) {
    return _meals.firstWhere((category) => category.id == id);
  }

  List<Meal> matchCategoryId(String id) {
    return _meals.where((element) => element.categories.contains(id)).toList();
  }
}
