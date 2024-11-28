import 'package:flutter/material.dart';

class EmployeeProfileOwnerController with ChangeNotifier {
  String employeeName = "Jhon";
  String userName = "Jhon123";
    String password = "Jhon1234567";
    // Track which field is being edited
int? editingFieldIndex;
 int? expandedIndex;  // Track expanded card index

   void updateField(int index, String value) {
    if (index == 0) {
      employeeName = value;
    } else if (index == 1) {
      userName = value;
    } else if (index == 2) {
      password = value;
    } 
    notifyListeners();
  }

  // Toggle expanded card state
  void toggleExpandedCard(int index) {
    if (expandedIndex == index) {
      expandedIndex = null;  // Collapse if the same card is clicked
    } else {
      expandedIndex = index;  // Expand the clicked card
    }
    notifyListeners();
  }

}
