import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/employeeportal/employee_customer_screen/view/employee_customer_screen.dart';

class EmployeeWorkScreen extends StatefulWidget {
  EmployeeWorkScreen({Key? key}) : super(key: key);

  @override
  _EmployeeWorkScreenState createState() => _EmployeeWorkScreenState();
}

class _EmployeeWorkScreenState extends State<EmployeeWorkScreen> {
  // Simulate backend data for assigned work
  final bool isWorkAssigned = true; // Toggle this for testing
  final List<Map<String, String>> assignedWork = [
    {"name": "John Doe", "id": "12345678901234"},
    {"name": "Jane Smith", "id": "98765432109876"},
    {"name": "Alice Brown", "id": "65432109876543"},
    {"name": "Bob White", "id": "45678901234567"},
    {"name": "Charlie Green", "id": "78901234567890"},
    {"name": "Diana Blue", "id": "32109876543210"},
  ]; // Replace with data from backend

  final List<String> items = List.generate(20, (index) => "Item ${index + 1}");

  // List to hold dynamically added customers
  List<Map<String, String>> additionalCustomers = [];

  void _addCustomer() {
    setState(() {
      // Add a new customer
      additionalCustomers.add({
        "name": "New Customer ${additionalCustomers.length + 1}",
        "id": "ID${10000000000000 + additionalCustomers.length}"
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        leading: Icon(null),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Assigned Work Section
              if (isWorkAssigned) ...[
                Text(
                  "Assigned Work",
                  style: GLTextStyles.subheadding2(),
                ),
                SizedBox(height: size.height * 0.02),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: assignedWork.length,
                  itemBuilder: (context, index) {
                    final customer = assignedWork[index];
                    return _buildCustomerCard(customer, index, size);
                  },
                ),
                SizedBox(height: size.height * 0.02),
              ],

              // Choose Customer Section
              Text(
                "Choose Customer",
                style: GLTextStyles.subheadding2(),
              ),
              SizedBox(height: size.height * 0.02),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: items.length > 10 ? 10 : items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EmployeeCustomerScreen()));
                      },
                      child: _buildStaticCustomerCard(index, size));
                },
              ),

              // Additional Customers Section
              if (additionalCustomers.isNotEmpty) ...[
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: additionalCustomers.length,
                  itemBuilder: (context, index) {
                    final customer = additionalCustomers[index];
                    return _buildCustomerCard(customer, index, size);
                  },
                ),
              ],
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorTheme.maincolor,
        onPressed: _addCustomer,
        label: Text(
          "Add Customers",
          style: GLTextStyles.flaotingbuttontext(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildCustomerCard(
      Map<String, String> customer, int index, Size size) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Customer ${index + 1}",
              style: GLTextStyles.categorytext(),
            ),
            SizedBox(height: size.height * 0.005),
            Text(
              "Customer ID: ${customer["id"]}",
              style:
                  GLTextStyles.onboardingandsavebutton(color: ColorTheme.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaticCustomerCard(int index, Size size) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(size.width * .03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Customer ${index + 1}",
              style: GLTextStyles.categorytext(),
            ),
            SizedBox(height: size.height * 0.005),
            Text(
              "Customer ID:123456789067",
              style:
                  GLTextStyles.onboardingandsavebutton(color: ColorTheme.black),
            ),
          ],
        ),
      ),
    );
  }
}
