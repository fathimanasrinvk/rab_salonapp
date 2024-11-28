import 'package:flutter/material.dart';

class EmployeeCustomerScreenController with ChangeNotifier {
  List<Map<String, String>> selectedServices = [];
  String customerName = "Customer 1";
  String customerID = "1234567890";
 String _searchQuery = "";
   Map<String, bool> _expandedCategories = {};
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
  
  // Track which field is being edited
  int? editingFieldIndex;

  // Updates the customer name or ID based on the field index
  void updateField(int index, String value) {
    if (index == 0) {
      customerName = value;
    } else if (index == 1) {
      customerID = value;
    }
    notifyListeners(); // Notify listeners to update the UI
  }

  // Selects a service, only adds it if it isn't already selected
  void selectService(Map<String, String> service) {
    // Check if the service is already in the selectedServices list by comparing the service name
    bool serviceExists = selectedServices.any((selectedService) =>
        selectedService["name"] == service["name"]);

    if (!serviceExists) {
      selectedServices.add(service);
      notifyListeners(); // Notify listeners to update the UI
    }
  }

  // Removes a service from the selected list
  void removeService(Map<String, String> service) {
    selectedServices.removeWhere((selectedService) =>
        selectedService["name"] == service["name"]);
    notifyListeners(); // Notify listeners to update the UI
  }
   String _selectedEmployeeName =
      ''; // Initialize with an empty string or some default value.

  String get selectedName => _selectedEmployeeName;

  void updateSelectedName(String name) {
    _selectedEmployeeName = name;
    notifyListeners();
  }
}
