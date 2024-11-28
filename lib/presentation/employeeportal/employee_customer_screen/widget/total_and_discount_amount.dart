import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/employeeportal/employee_customer_screen/controller/employee_customer_screen_controller.dart';
import 'package:rab_salon/presentation/employeeportal/employee_customer_screen/controller/total_and_discount_amount_controller.dart'; // Import DiscountProvider

class BottomNavigationBarWidget extends StatelessWidget {
  final String totalAmount;
  final Function(String) onDiscountUpdated;

  BottomNavigationBarWidget({
    required this.totalAmount,
    required this.onDiscountUpdated,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Function to show the Discount Dialog
    void _showDiscountDialog() {
      final discountProvider =
          Provider.of<DiscountProvider>(context, listen: false);
      final TextEditingController _discountController = TextEditingController();

      showDialog(
        context: context,
        builder: (context) {
          var size = MediaQuery.of(context).size; // Get screen size

          return AlertDialog(
            title: Center(
              child: Text(
                "Enter Discount Price",
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold, fontSize: size.width * 0.04),
              ),
            ),
            content: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _discountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.lato(),
                      hintText: "Enter amount",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              // Make buttons width responsive based on screen size
              SizedBox(
                width: size.width *
                    0.3, // Set button width to a fraction of screen width
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: size.width *
                    0.3, // Set button width to a fraction of screen width
                child: TextButton(
                  onPressed: () {
                    discountProvider
                        .updateDiscountedPrice(_discountController.text);
                    onDiscountUpdated(_discountController.text); // Notify parent screen
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text(
                    "Ok",
                    style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: size.width * 0.05,
        ),
        decoration: BoxDecoration(
          color: ColorTheme.maincolor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: Offset(0, -4),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First Row: Total Amount
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "Total Amount",
                        style: GLTextStyles.registertxt1(),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "₹ $totalAmount",
                        style: GLTextStyles.registertxt1(),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "Discounted Price",
                        style: GLTextStyles.registertxt1(),
                      ),
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: _showDiscountDialog,
                        child: Consumer<DiscountProvider>(
                          builder: (context, discountProvider, child) {
                            return Text(
                              discountProvider.discountedPrice,
                              style: GLTextStyles.registertxt1(),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
