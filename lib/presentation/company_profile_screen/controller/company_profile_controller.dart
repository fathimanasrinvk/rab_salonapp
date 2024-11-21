import 'package:flutter/material.dart';

class CompanyProfileController {
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController registrationNumberController =
      TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController numberofOwnerController = TextEditingController();
  final TextEditingController numberOfBranchController =
      TextEditingController();
  final TextEditingController mainBranchController = TextEditingController();
  final TextEditingController numberofEmployeeController =
      TextEditingController();

  final ValueNotifier<bool> isEditingCompanyName = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isEditingRegistrationNumber =
      ValueNotifier<bool>(false);
  final ValueNotifier<bool> isEditingLocation = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isEditingNumberofOwner = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isEditingNumberOfBranch =
      ValueNotifier<bool>(false);
  final ValueNotifier<bool> isEditingMainBranch = ValueNotifier<bool>(false);

  final ValueNotifier<bool> isEditingNumberofEmployee =
      ValueNotifier<bool>(false);

  String initialCompanyName = "Rabloon";
  String initialRegistrationNumber = "12345678";
   String initialLocation = "Kochi";
   String initialNumberofOwner = "3";
   String initialNumberOfBranch = "3";
    String initialMainBranch = "Rabloon";
    String initialNumberofEmployee = "4";

    void toggleCompanyNameEditMode() {
  if (isEditingCompanyName.value) {
    // Save changes when editing ends
    initialCompanyName = companyNameController.text;
  }
  isEditingCompanyName.value = !isEditingCompanyName.value;

  if (!isEditingCompanyName.value) {
    // Reset the text field to initial text when not editing
    companyNameController.text = initialCompanyName;
  }
}
 void toggleRegistrationNumber() {
  if (isEditingRegistrationNumber.value) {
    // Save changes when editing ends
    initialRegistrationNumber = registrationNumberController.text;
  }
  isEditingRegistrationNumber.value = !isEditingRegistrationNumber.value;

  if (!isEditingRegistrationNumber.value) {
    // Reset the text field to initial text when not editing
    registrationNumberController.text = initialRegistrationNumber;
  }
}
 void toggleLocation () {
  if (isEditingLocation .value) {
    // Save changes when editing ends
    initialRegistrationNumber = locationController.text;
  }
  isEditingLocation .value = !isEditingLocation .value;

  if (!isEditingLocation .value) {
    // Reset the text field to initial text when not editing
    locationController.text = initialLocation ;
  }
}
void toggleNumberofOwner () {
  if (isEditingNumberofOwner .value) {
    // Save changes when editing ends
    initialNumberofOwner = numberofOwnerController.text;
  }
  isEditingNumberofOwner .value = !isEditingNumberofOwner .value;

  if (!isEditingNumberofOwner.value) {
    // Reset the text field to initial text when not editing
    numberofOwnerController.text = initialNumberofOwner ;
  }
}
void toggleNumberOfBranch () {
  if (isEditingNumberOfBranch .value) {
    // Save changes when editing ends
    initialNumberOfBranch = numberOfBranchController.text;
  }
  isEditingNumberOfBranch .value = !isEditingNumberOfBranch .value;

  if (!isEditingNumberOfBranch.value) {
    // Reset the text field to initial text when not editing
    numberOfBranchController.text = initialNumberOfBranch ;
  }
}
void toggleMainBranch () {
  if (isEditingMainBranch .value) {
    // Save changes when editing ends
    initialMainBranch = mainBranchController.text;
  }
  isEditingMainBranch.value = !isEditingMainBranch .value;

  if (!isEditingMainBranch.value) {
    // Reset the text field to initial text when not editing
    mainBranchController.text = initialMainBranch ;
  }
}
void toggleNumberofEmployee () {
  if (isEditingNumberofEmployee .value) {
    // Save changes when editing ends
    initialNumberofEmployee = numberofEmployeeController.text;
  }
  isEditingNumberofEmployee.value = !isEditingNumberofEmployee .value;

  if (!isEditingNumberofEmployee.value) {
    // Reset the text field to initial text when not editing
    numberofEmployeeController.text = initialNumberofEmployee ;
  }
}
  final ValueNotifier<bool> isBranchAdded = ValueNotifier<bool>(false);

  void markBranchAsAdded() {
    isBranchAdded.value = true;
  }
}

