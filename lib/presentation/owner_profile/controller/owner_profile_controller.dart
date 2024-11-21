import 'package:flutter/material.dart';

class OwnerProfileController with ChangeNotifier {
  String ownerName = "Cabello";
  String phone = "+91 1234567890";
  String email = "owner@gmail.com";
  String aadhar = "1234567890";

  // Track which field is being edited
  int? editingFieldIndex;

  List<Map<String, String>> partners = [];

  // Set the editing field index
  void setEditingField(int? index) {
    editingFieldIndex = index;
    notifyListeners();
  }

  // Update the field value
  void updateField(int index, String value) {
    if (index == 0) {
      ownerName = value;
    } else if (index == 1) {
      phone = value;
    } else if (index == 2) {
      email = value;
    } else if (index == 3) {
      aadhar = value;
    }
    notifyListeners();
  }

  // Add a partner
  void addPartner(Map<String, String> partner) {
    partners.add(partner);
    notifyListeners();
  }
}