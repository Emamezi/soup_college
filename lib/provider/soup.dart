import 'package:flutter/foundation.dart';

class Soup with ChangeNotifier {
  final String id;
  final String title;
  final List steps;
  final String origin;
  final String imageUrl;
  final String description;
  final int duration;
  final List ingredients;
  bool isFavourite;

  Soup({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.ingredients,
    this.steps,
    this.origin,
    this.duration,
    this.isFavourite = false,
  });

  void toggleFavouriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
