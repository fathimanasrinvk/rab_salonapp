import 'package:flutter/material.dart';

class EmployeeProfileOwnerController {
  // TextEditingControllers to manage text field input for different fields
  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ValueNotifiers to manage edit mode (whether each field is editable or not)
  final ValueNotifier<bool> isEditingEmployeeName = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isEditingUserName = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isEditingPassword = ValueNotifier<bool>(false);

  // Initial text (these can be modified or fetched from a database)
  String initialEmployeeName = "John Doe";
  String initialUserName = "johndoe";
  String initialPassword = "password123";

  // Function to toggle edit mode for employee name
  void toggleEmployeeNameEditMode() {
    if (isEditingEmployeeName.value) {
      // Save changes when editing ends
      initialEmployeeName = employeeNameController.text;
    }
    isEditingEmployeeName.value = !isEditingEmployeeName.value;
    if (!isEditingEmployeeName.value) {
      // Reset the text field to initial text when not editing
      employeeNameController.text = initialEmployeeName;
    }
  }

  // Function to toggle edit mode for user name
  void toggleUserNameEditMode() {
    if (isEditingUserName.value) {
      // Save changes when editing ends
      initialUserName = userNameController.text;
    }
    isEditingUserName.value = !isEditingUserName.value;
    if (!isEditingUserName.value) {
      // Reset the text field to initial text when not editing
      userNameController.text = initialUserName;
    }
  }

  // Function to toggle edit mode for password
  void togglePasswordEditMode() {
    if (isEditingPassword.value) {
      // Save changes when editing ends
      initialPassword = passwordController.text;
    }
    isEditingPassword.value = !isEditingPassword.value;
    if (!isEditingPassword.value) {
      // Reset the text field to initial text when not editing
      passwordController.text = initialPassword;
    }
  }
}
