import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/employeeportal/employee_customer_screen/controller/employee_customer_screen_controller.dart';
import 'package:rab_salon/presentation/employeeportal/employee_customer_screen/controller/total_and_discount_amount_controller.dart';
import 'package:rab_salon/presentation/employeeportal/employee_customer_screen/widget/total_and_discount_amount.dart';

class EmployeeCustomerScreen extends StatelessWidget {
  const EmployeeCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Callback to handle discount update, which will be used in BottomNavigationBarWidget
      void _updateDiscountedPrice(BuildContext context, String newPrice) {
    Provider.of<DiscountProvider>(context, listen: false)
        .updateDiscountedPrice(newPrice);
  }

    final employeeController =
        Provider.of<EmployeeCustomerScreenController>(context);
    var size = MediaQuery.of(context).size;

    // Simulate backend data for services
    final List<Map<String, String>> servicesCustomer = [
      {"name": "Haircut", "duration": "30 minutes", "price": "\$20"},
      {"name": "Shave", "duration": "15 minutes", "price": "\$10"},
      {"name": "Facial", "duration": "45 minutes", "price": "\$35"},
      {"name": "Massage", "duration": "60 minutes", "price": "\$50"},
    ];
    final List<String> categories = [
      "Hair Color",
      "Nail Care",
      "Facial Treatment",
      "Skin Care",
      "Massage",
      "Waxing",
      "Makeup",
    ];

    final Map<String, List<String>> services = {
      "Hair Color": ["Service 1", "Service 2", "Service 3", "Service 4"],
      "Nail Care": ["Service 1", "Service 2", "Service 3"],
      "Facial Treatment": ["Service 1", "Service 2", "Service 3"],
      "Skin Care": ["Service 1", "Service 2", "Service 3"],
      "Massage": ["Service 1", "Service 2", "Service 3"],
      "Waxing": ["Service 1", "Service 2", "Service 3"],
      "Makeup": ["Service 1", "Service 2", "Service 3"],
    };
    bool hasServices =
        services.values.any((serviceList) => serviceList.isNotEmpty);

    return Scaffold(
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        backgroundColor: ColorTheme.white,
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("RABLOON", style: GLTextStyles.subheadding()),
            Text("LOCATION", style: GLTextStyles.locationtext()),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildEditableField(
                  "Customer Name (Optional)",
                  employeeController.customerName,
                  (value) => employeeController.updateField(0, value),
                  size,
                  0,
                  employeeController),
              SizedBox(height: size.height * 0.02),
              buildEditableField(
                  "Customer ID",
                  employeeController.customerID,
                  (value) => employeeController.updateField(0, value),
                  size,
                  1,
                  employeeController),
              SizedBox(height: size.height * 0.02),
              if (hasServices) ...[
                if (employeeController.selectedServices.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Purchased Services",
                          style: GLTextStyles.textformfieldtitle()),
                      SizedBox(height: size.height * 0.02),
                      SizedBox(
                        height: size.height * 0.15,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: employeeController.selectedServices.length,
                          itemBuilder: (context, index) {
                            final service =
                                employeeController.selectedServices[index];
                            return Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.05),
                              child: GestureDetector(
                                onTap: (){
                                   _showRemoveServiceDialog(
                                      context, employeeController, service);
                                },
                                onLongPress: () {
                                  _showAlertDialog(context);
                                 
                                },
                                child: buildServiceCard(service, size),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                SizedBox(height: size.height * 0.02),
                // Experted Services Section
                Text("Experted Services",
                    style: GLTextStyles.textformfieldtitle()),
                SizedBox(height: size.height * 0.02),
                // List of available services
                SizedBox(
                  height: size.height * 0.15,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: servicesCustomer.length,
                    itemBuilder: (context, index) {
                      final service = servicesCustomer[index];
                      return Padding(
                        padding: EdgeInsets.only(right: size.width * 0.05),
                        child: GestureDetector(
                          onTap: () =>
                              employeeController.selectService(service),
                          child: buildServiceCard(service, size),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                Text("All Services ", style: GLTextStyles.textformfieldtitle()),
                SizedBox(height: size.height * 0.03),
                Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.secondarycolor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        offset: Offset(0, 4),
                        blurRadius: 8,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.search, color: ColorTheme.lightgrey),
                      hintText: "Search for services...",
                      hintStyle: GLTextStyles.greytxt(),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.04,
                      ),
                    ),
                    onChanged: (query) {
                      context
                          .read<EmployeeCustomerScreenController>()
                          .updateSearchQuery(query);
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Consumer<EmployeeCustomerScreenController>(
                  builder: (context, employeeController, child) {
                    String searchQuery =
                        employeeController.searchQuery.toLowerCase();
                    List<String> filteredCategories = categories
                        .where((category) =>
                            category.toLowerCase().contains(searchQuery))
                        .toList();

                    if (filteredCategories.isEmpty) {
                      return Center(
                        child: Text(
                          "Your searched service is not available",
                          style: GLTextStyles.bottomtxt2()
                              .copyWith(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: filteredCategories.length,
                      itemBuilder: (context, index) {
                        String category = filteredCategories[index];
                        bool isExpanded =
                            employeeController.expandedCategories[category] ??
                                false;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Card(
                            color: ColorTheme.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 5,
                            child: InkWell(
                              onTap: () {
                                employeeController.toggleCategory(category);
                              },
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(category,
                                        style: GLTextStyles.categorytext()),
                                  ),
                                  AnimatedSize(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    child: Visibility(
                                      visible: isExpanded,
                                      child: Column(
                                        children: services[category]!
                                            .where((service) => service
                                                .toLowerCase()
                                                .contains(searchQuery))
                                            .map((service) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0,
                                                horizontal: 16.0),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              elevation: 3,
                                              child: InkWell(
                                                onTap: () {
                                                  Map<String, String>
                                                      serviceDetails = {
                                                    'name': service,
                                                    'category': " Women",
                                                    'price': '₹500'
                                                  };
                                                  employeeController
                                                      .selectService(
                                                          serviceDetails);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(
                                                      size.height * 0.01),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Service: $service",
                                                          style: GLTextStyles
                                                              .onboardbottomcardtxt()),
                                                      Text(
                                                          "Category: $category",
                                                          style: GLTextStyles
                                                              .onboardbottomcardtxt()),
                                                      Text("Price: TBD",
                                                          style: GLTextStyles
                                                              .onboardbottomcardtxt()), // Replace with dynamic price
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ] else
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                    child: Text(
                      "No services added by your company owner",
                      style: GLTextStyles.bottomtxt2()
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        totalAmount: "100", // Pass the total amount here
        onDiscountUpdated: (newPrice) =>
            _updateDiscountedPrice(context, newPrice), // Pass the callback
      ),
    );
  }

  Widget buildServiceCard(Map<String, String> service, Size size) {
    // Ensure none of the values are null before using them
    String name = service['name'] ?? 'Unknown Service';
    String price = service['price'] ?? '₹200'; // Price with fallback if null

    // Dynamically calculate container width based on screen size
    double containerWidth = size.width * 0.35; // 35% of screen width

    // Optionally, limit the width to avoid stretching too much on large screens
    if (containerWidth > 400) {
      containerWidth = 400; // Set a maximum width
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5,
      child: Container(
        width: containerWidth, // Set the dynamic width
        padding: EdgeInsets.all(size.height * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                child:
                    Text("$name", style: GLTextStyles.onboardbottomcardtxt())),
            Flexible(
                child:
                    Text("Women", style: GLTextStyles.onboardbottomcardtxt())),
            Flexible(
                child: Text(price, style: GLTextStyles.onboardbottomcardtxt())),
          ],
        ),
      ),
    );
  }

  // Show an alert dialog to confirm the removal of the service
  void _showRemoveServiceDialog(
      BuildContext context,
      EmployeeCustomerScreenController controller,
      Map<String, String> service) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var size = MediaQuery.of(context).size; // Get screen size

        return AlertDialog(
          title: Text(
            "Remove Service",
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.05), // Dynamically adjust font size
          ),
          content: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05), // Adjust padding
            child: Text(
              "Do you want to remove this service from the purchased list?",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04), // Adjust text size
            ),
          ),
          actions: <Widget>[
            // Make buttons width responsive based on screen size
            SizedBox(
              width: size.width *
                  0.3, // Set button width to a fraction of screen width
              child: TextButton(
                onPressed: () {
                  controller.removeService(
                      service); // Remove the service from the list
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text(
                  "Yes",
                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: size.width *
                  0.3, // Set button width to a fraction of screen width
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text(
                  "No",
                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildEditableField(
    String label,
    String value,
    Function(String) onSave,
    Size size,
    int index,
    EmployeeCustomerScreenController controller,
  ) {
    return Consumer<EmployeeCustomerScreenController>(
      builder: (context, controller, child) {
        bool isEditable = controller.editingFieldIndex == index;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: GLTextStyles.textformfieldtitle()),
            SizedBox(height: size.height * 0.01),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.0355),
              decoration: BoxDecoration(
                color: ColorTheme.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: isEditable
                        ? TextFormField(
                            initialValue: value,
                            onChanged: onSave,
                            style: GLTextStyles.textformfieldtext2(),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )
                        : Text(
                            value,
                            style: GLTextStyles.textformfieldtext2(),
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                  IconButton(
                    icon: Icon(
                      isEditable ? Icons.check : Icons.edit,
                      color: ColorTheme.maincolor,
                    ),
                    onPressed: () {
                      controller.editingFieldIndex = isEditable ? null : index;
                      controller.notifyListeners();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

void _showAlertDialog(BuildContext context) async {
    // Hardcoded names list
    List<String> names = [
      'John',
      'Jane',
      'Bob',
      'Alice',
      'John',
      'Jane',
      'Bob',
      'Alice'
    ];

    showDialog(
      context: context,
      builder: (context) {
        var size = MediaQuery.of(context).size; // Get screen size

        return AlertDialog(
          title: Center(
              child: Text(
            "Assign this Work To",
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold, fontSize: size.width * 0.04),
          )),
          content: SingleChildScrollView(
            // Make the content scrollable
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Display a list of names with checkboxes
                ...names.map((name) {
                  return Consumer<EmployeeCustomerScreenController>(
                    builder: (context, provider, child) {
                      // Check if this name is selected
                      bool isSelected = provider.selectedName == name;
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            // Checkbox to show selection
                            Expanded(
                              child: Checkbox(
                                value: isSelected,
                                onChanged: (bool? newValue) {
                                  provider.updateSelectedName(name);
                                },
                              ),
                            ),
                            // Name text
                            Expanded(
                              child: Text(
                                name,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.02,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ],
            ),
          ),
          actions: [
            // Confirm button to close the dialog
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

}
