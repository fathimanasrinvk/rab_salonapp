import 'package:flutter/material.dart';

class AddPartnerController extends ChangeNotifier {
  // Define a GlobalKey for the form
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // TextEditingControllers for form fields
  TextEditingController partnerNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Method to get the partner details from the form
  Map<String, String> getPartnerDetails() {
    return {
      "Partner Name": partnerNameController.text,
      "Email": emailController.text,
      "User Name": userNameController.text,
      "Password": passwordController.text,
    };
  }

  // Clear the fields after saving
  void clearFields() {
    partnerNameController.clear();
    emailController.clear();
    userNameController.clear();
    passwordController.clear();
  }

  // Dispose controllers to avoid memory leaks
  @override
  void dispose() {
    partnerNameController.dispose();
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
