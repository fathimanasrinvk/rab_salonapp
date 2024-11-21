import 'package:flutter/material.dart';

class BranchDetailsController {
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController branchLocationController =
      TextEditingController();
  final TextEditingController branchregistrationNumberController =
      TextEditingController();
  final TextEditingController branchNumberController = TextEditingController();
  final TextEditingController numberofEmployeeController =
      TextEditingController();

  final ValueNotifier<bool> isEditingBranchName = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isEditingBranchLocation =
      ValueNotifier<bool>(false);
  final ValueNotifier<bool> isEditingBranchregistrationNumber =
      ValueNotifier<bool>(false);
  final ValueNotifier<bool> isEditingBranchNumber =
      ValueNotifier<bool>(false);
  final ValueNotifier<bool> isEditingNumberofEmployee =
      ValueNotifier<bool>(false);
  String initialBranchName = "Rabloon";
  String initialBranchLocation = "Kochi";
  String initialBranchregistrationNumber = "123456789";
    String initialBranchNumber = "2";
    String initialNumberofEmployee = "2";
 void toggleBranchName() {
  if (isEditingBranchName.value) {
    // Save changes when editing ends
    initialBranchName = branchNameController.text;
  }
  isEditingBranchName.value = !isEditingBranchName.value;

  if (!isEditingBranchName.value) {
    // Reset the text field to initial text when not editing
    branchNameController.text = initialBranchName;
  }
}
 void toggleBranchLocation() {
  if ( isEditingBranchLocation.value) {
    // Save changes when editing ends
     initialBranchLocation = branchLocationController.text;
  }
   isEditingBranchLocation.value = ! isEditingBranchLocation.value;

  if (! isEditingBranchLocation.value) {
    // Reset the text field to initial text when not editing
    branchLocationController.text =  initialBranchLocation;
  }
}
 void toggleBranchregistrationNumber () {
  if ( isEditingBranchregistrationNumber .value) {
    // Save changes when editing ends
     initialBranchregistrationNumber  = branchregistrationNumberController.text;
  }
   isEditingBranchregistrationNumber .value = ! isEditingBranchregistrationNumber .value;

  if (! isEditingBranchregistrationNumber .value) {
    // Reset the text field to initial text when not editing
    branchregistrationNumberController.text =  initialBranchregistrationNumber ;
  }
}
 void toggleBranchNumber () {
  if ( isEditingBranchNumber .value) {
    // Save changes when editing ends
     initialBranchNumber  = branchNumberController.text;
  }
   isEditingBranchNumber .value = ! isEditingBranchNumber .value;

  if (! isEditingBranchNumber .value) {
    // Reset the text field to initial text when not editing
    branchNumberController.text =  initialBranchNumber;
  }
}
 void toggleNumberofEmployee () {
  if ( isEditingNumberofEmployee .value) {
    // Save changes when editing ends
     initialNumberofEmployee  = numberofEmployeeController.text;
  }
   isEditingNumberofEmployee .value = ! isEditingNumberofEmployee .value;

  if (! isEditingNumberofEmployee .value) {
    // Reset the text field to initial text when not editing
    numberofEmployeeController.text =  initialNumberofEmployee;
  }
}
}
