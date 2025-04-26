import 'package:flutter/material.dart';

/// A provider class that manages the state of a bottom navigation bar.
///
/// This class extends [ChangeNotifier] to notify listeners about changes
/// in the current index of the navigation bar.

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
