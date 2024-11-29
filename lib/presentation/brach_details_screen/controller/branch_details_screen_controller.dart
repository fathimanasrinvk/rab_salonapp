import 'package:flutter/material.dart';

class BranchDetailsScreenController with ChangeNotifier {
  String branchName = "Rabloon";
  String branchLocation = "Kochi";
  String registrationNumber = "502340";
  String branchNumber = "2";
  String numberofEmployee = "500";

  int? editingFieldIndex;
  int? expandedIndex;
  void updateField(int index, String value) {
    if (index == 0) {
      branchName = value;
    } else if (index == 1) {
      branchLocation = value;
    } else if (index == 2) {
      registrationNumber = value;
    } else if (index == 3) {
      branchNumber = value;
    } else if (index == 4) {
      numberofEmployee = value;
    }
    notifyListeners();
  }
}
