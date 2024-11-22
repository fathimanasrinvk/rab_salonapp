import 'package:flutter/material.dart';

class AddEmployeeController extends ChangeNotifier {
  Map<String, bool> _expandedCategories = {};
  List<String> selectedServices = [];
  String _searchQuery = "";
  Map<String, bool> get expandedCategories => _expandedCategories;
  String get searchQuery => _searchQuery;
  final Map<String, TextEditingController> percentageControllers = {};

  void toggleCategory(String category) {
    _expandedCategories[category] = !(_expandedCategories[category] ?? false);
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  // Define a GlobalKey for the form
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // TextEditingControllers for form fields
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Method to get the partner details from the form
  Map<String, String> getPartnerDetails() {
    return {
      "Employee Name": employeeNameController.text,
      "User Name": userNameController.text,
      "Password": passwordController.text,
    };
  }

  // Clear the fields after saving
  void clearFields() {
    employeeNameController.clear();
    userNameController.clear();
    passwordController.clear();
  }

  // Dispose controllers to avoid memory leaks
  @override
  void dispose() {
    employeeNameController.dispose();

    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

   void toggleServiceSelection(String service) {
    if (selectedServices.contains(service)) {
      selectedServices.remove(service);
      percentageControllers.remove(service)?.dispose();
    } else {
      selectedServices.add(service);
      percentageControllers[service] = TextEditingController();
    }
    notifyListeners();
  }
  void removeService(String service) {
    selectedServices.remove(service);
    percentageControllers.remove(service)?.dispose();
    notifyListeners();
  }

  void updateServicePercentage(String service, String percentage) {
    // Handle percentage updates if needed
    notifyListeners();
  }
}
