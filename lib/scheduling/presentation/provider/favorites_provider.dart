import 'package:flutter/material.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/court_model.dart';

class FavoritesProvider with ChangeNotifier {
  final Set<CourtModel> _favorites = {};

  bool isFavorite(CourtModel court) {
    return _favorites.contains(court);
  }

  void toggleFavorite(CourtModel court) {
    if (_favorites.contains(court)) {
      _favorites.remove(court);
    } else {
      _favorites.add(court);
    }
    notifyListeners();
  }

  Set<CourtModel> get favorites => _favorites;
}
