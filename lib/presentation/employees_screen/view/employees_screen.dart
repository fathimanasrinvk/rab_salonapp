import 'package:flutter/material.dart';
import 'package:rab_salon/core/common/drawer/custom_drawer.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    List<String>? employees = ["John Doe", "Jane Smith", "Alice Johnson"];

    List<Map<String, String>> branches = [
      {"branchName": " BRANCH", "location": "DOWNTOWN"},
      {"branchName": "BRANCH", "location": "DOWNTOWN"},
    ];

    return Scaffold(
      drawer: CustomDrawer(size: size, branches: branches),
      appBar: AppBar(
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
        child: employees != null && employees.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Salon Employees",
                    style: GLTextStyles.subheadding2(),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Expanded(
                    child: ListView.builder(
                      itemCount: employees.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: ColorTheme.white,
                          elevation: 4,
                          margin:
                              EdgeInsets.symmetric(vertical: size.width * .02),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            height: size.height *
                                0.08, // Set desired height for the ListTile
                            alignment: Alignment.center,
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: size.height * .016),
                              title: Center(
                                child: Text(
                                  employees[index],
                                  style: GLTextStyles.categorytext(),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No employees available",
                      style: GLTextStyles.greytxt(),
                    ),
                    Text(
                      "Add Your Employees",
                      style: GLTextStyles.greytxt(),
                    ),
                  ],
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorTheme.maincolor,
        onPressed: () {},
        label: Text(
          "Add Your Employees",
          style: GLTextStyles.flaotingbuttontext(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}