import 'package:flutter/material.dart';

class ServiceController with ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  List<String> allServices = [
    "Hair Color",
    "Haircut",
    "Manicure",
    "Pedicure",
    "Massage",
    "Facial"
  ];
  List<String> filteredServices = [];
  bool isLoading = false;

  ServiceController() {
    filteredServices = allServices;
    searchController.addListener(() {
      searchServices(searchController.text);
    });
  }

  void searchServices(String query) {
    isLoading = true;
    notifyListeners();

    Future.delayed(Duration(milliseconds: 500), () {
      filteredServices = allServices
          .where(
              (service) => service.toLowerCase().contains(query.toLowerCase()))
          .toList();
      isLoading = false;
      notifyListeners();
    });
  }
}
