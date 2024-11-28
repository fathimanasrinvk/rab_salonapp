import 'package:flutter/material.dart';

class DiscountProvider extends ChangeNotifier {
  // Private field for discounted price
  String _discountedPrice = "₹ 0"; 

  // Getter to access the discounted price
  String get discountedPrice => _discountedPrice;

  // Method to update the discounted price
  void updateDiscountedPrice(String newPrice) {
    // Update the discounted price based on the new value passed
    _discountedPrice = "₹ $newPrice";
    // Notify listeners to update the UI
    notifyListeners();
  }
}
