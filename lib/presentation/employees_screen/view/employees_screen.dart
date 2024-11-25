import 'package:flutter/material.dart';
import 'package:rab_salon/core/common/drawer/custom_drawer.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/add_employee_screen/view/add_employee_screen.dart';
import 'package:rab_salon/presentation/employee_profile_owner/view/employee_profile_owner_screen.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    List<String> employees = ["John Doe", "Jane Smith", "Alice Johnson"];
    List<Map<String, String>> branches = [
      {"branchName": "BRANCH", "location": "DOWNTOWN"},
      {"branchName": "BRANCH", "location": "DOWNTOWN"},
    ];

    return Scaffold(
      backgroundColor: ColorTheme.white,
      drawer: CustomDrawer(size: size, branches: branches),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
        child: StatefulBuilder(
          builder: (context, setState) {
            return employees.isNotEmpty
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
                              margin: EdgeInsets.symmetric(
                                  vertical: size.width * .02),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                title: Text(
                                  employees[index],
                                  style: GLTextStyles.categorytext(),
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete,
                                      color: ColorTheme.maincolor),
                                  onPressed: () {
                                    setState(() {
                                      employees.removeAt(index);
                                    });
                                  },
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EmployeeProfileOwnerScreen()));
                                },
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
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorTheme.maincolor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddEmployeeScreen()));
        },
        label: Text(
          "Add Your Employees",
          style: GLTextStyles.flaotingbuttontext(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
