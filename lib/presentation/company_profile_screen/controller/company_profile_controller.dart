import 'package:flutter/material.dart';

class CompanyProfileController with ChangeNotifier{
    bool _isBranchAdded = false;
  String companyName = "Jhon";
  String companyRegistrationNumber = "1234567";
    String companyLocation = "Kochi";
 String numberofOwners = "7";
 String numberofBranch = "5";
 String mainBranch = "5";
 String numberofEmployee = "5";
 // Track which field is being edited
int? editingFieldIndex;
 int? expandedIndex;  // Track expanded card index
     
  void updateField(int index, String value) {
    if (index == 0) {
      companyName = value;
    } else if (index == 1) {
      companyRegistrationNumber = value;
    } else if (index == 2) {
      companyLocation = value;
    } else if (index == 3) {
      numberofOwners = value;
    } else if (index == 4) {
      numberofBranch = value;
    } else if (index == 5) {
      mainBranch = value;
    } else if (index == 6) {
      numberofEmployee = value;
    } 
    notifyListeners();
  }
  // ValueNotifier to track if branches are added
  final ValueNotifier<bool> isBranchAdded = ValueNotifier<bool>(false);

  // Function to mark branch as added
  void markBranchAsAdded() {
    isBranchAdded.value = true;
  }
}

