import 'package:flutter/foundation.dart';

class CategoryItems with ChangeNotifier {
  final String id;
  final String title;

  CategoryItems({
    @required this.id,
    @required this.title,
  });
}