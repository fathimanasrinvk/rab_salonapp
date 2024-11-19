import 'package:flutter/material.dart';

class AddEmployeeController with ChangeNotifier {
  String employeeName = '';
  String username = '';
  String password = '';
  String searchQuery = ''; // Add this property

  // Grouped services (by category)
  Map<String, List<Map<String, String>>> groupedServices = {};

  // Filtered services for search functionality
  List<Map<String, String>> filteredServices = [];

  // Setters for employee information
  void setEmployeeName(String name) {
    employeeName = name;
    notifyListeners();
  }

  void setUsername(String name) {
    username = name;
    notifyListeners();
  }

  void setPassword(String pass) {
    password = pass;
    notifyListeners();
  }

  // Set grouped services
  void setGroupedServices(Map<String, List<Map<String, String>>> services) {
    groupedServices = services;
    notifyListeners();
  }

  // Set filtered services (for search)
  void setFilteredServices(List<Map<String, String>> services) {
    filteredServices = services;
    notifyListeners();
  }

  // Update search query
  void updateSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }
}
