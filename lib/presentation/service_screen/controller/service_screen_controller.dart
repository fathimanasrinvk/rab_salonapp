import 'package:flutter/material.dart';

class ServiceScreenController with ChangeNotifier {
  Map<String, bool> _expandedCategories = {};
  String _searchQuery = "";
  Map<String, List<String>> _services = {
    "Hair Color": ["Service 1", "Service 2", "Service 3", "Service 4"],
    "Nail Care": ["Service 1", "Service 2", "Service 3"],
    "Facial Treatment": ["Service 1", "Service 2", "Service 3"],
    "Skin Care": ["Service 1", "Service 2", "Service 3"],
    "Massage": ["Service 1", "Service 2", "Service 3"],
    "Waxing": ["Service 1", "Service 2", "Service 3"],
    "Makeup": ["Service 1", "Service 2", "Service 3"],
  };
  List<String> categories = [
    "Hair Color",
    "Nail Care",
    "Facial Treatment",
    "Skin Care",
    "Massage",
    "Waxing",
    "Makeup",
  ];
  Map<String, bool> get expandedCategories => _expandedCategories;
  String get searchQuery => _searchQuery;
  Map<String, List<String>> get services => _services;
  void toggleCategory(String category) {
    _expandedCategories[category] = !(_expandedCategories[category] ?? false);
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  // Function to remove a category
  void removeCategory(String category) {
    categories.remove(category);
    services.remove(category);
    print("Removed category: $category"); // Debugging line
    notifyListeners();
  }

  // Function to remove a service from a specific category
  void removeService(String category, String service) {
    services[category]?.remove(service);
    if (services[category]?.isEmpty ?? true) {
      services.remove(category);
      categories.remove(category);
    }
    notifyListeners();
  }
}
