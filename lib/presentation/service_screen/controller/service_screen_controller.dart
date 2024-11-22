import 'package:flutter/material.dart';

class ServiceScreenController with ChangeNotifier {
  Map<String, bool> _expandedCategories = {};
  String _searchQuery = "";

  Map<String, bool> get expandedCategories => _expandedCategories;
  String get searchQuery => _searchQuery;

  void toggleCategory(String category) {
    _expandedCategories[category] = !(_expandedCategories[category] ?? false);
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}

