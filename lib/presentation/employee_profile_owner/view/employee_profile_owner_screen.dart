import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/employee_profile_owner/controller/employee_profile_owner_controller.dart';
import 'package:rab_salon/presentation/employee_profile_owner/widget/editable_textfromfield.dart';

class EmployeeProfileOwnerScreen extends StatelessWidget {
  final EmployeeProfileOwnerController _profileController =
      EmployeeProfileOwnerController();

  // Simulating backend data fetching with customer IDs
  Future<List<Map<String, String>>> fetchTodaysWork() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating network delay
    return [
      {"task": "Customer 1", "customerId": "C001"},
      {"task": "Customer 2", "customerId": "C002"},
      {"task": "Customer 1", "customerId": "C001"},
      {"task": "Customer 2", "customerId": "C002"},
      {"task": "Customer 1", "customerId": "C001"},
      {"task": "Customer 2", "customerId": "C002"},
      {"task": "Customer 1", "customerId": "C001"},
      {"task": "Customer 2", "customerId": "C002"},
    ]; // Sample tasks with customer IDs
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        backgroundColor: ColorTheme.white,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('RABLOON', style: GLTextStyles.subheadding()),
            Text('LOCATION', style: GLTextStyles.locationtext()),
          ],
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          // SingleChildScrollView for the main content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Editable text fields (Employee Name, User Name, etc.)
                    EditableTextField(
                      label: "Employee Name",
                      controller: _profileController.employeeNameController,
                      initialText: _profileController.initialEmployeeName,
                      isEditing: _profileController.isEditingEmployeeName,
                      // toggleEditMode:
                      //     _profileController.toggleEmployeeNameEditMode,
                    ),
                    SizedBox(height: size.height * 0.01),
                    EditableTextField(
                      label: "User Name",
                      controller: _profileController.userNameController,
                      initialText: _profileController.initialUserName,
                      isEditing: _profileController.isEditingUserName,
                     // toggleEditMode: _profileController.toggleUserNameEditMode,
                    ),
                    SizedBox(height: size.height * 0.01),
                    EditableTextField(
                      label: "Password",
                      controller: _profileController.passwordController,
                      initialText: _profileController.initialPassword,
                      isEditing: _profileController.isEditingPassword,
                    //  toggleEditMode: _profileController.togglePasswordEditMode,
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text("Today's Work",
                        style: GLTextStyles.textformfieldtitle()),
                    SizedBox(height: size.height * 0.01),

                    // FutureBuilder for Today's Work List
                    FutureBuilder<List<Map<String, String>>>(
                      future: fetchTodaysWork(), // Fetch the list from backend
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child:
                                  CircularProgressIndicator()); // Show loading indicator
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Text('No tasks for today');
                        } else {
                          // Display ListTile for each task
                          List<Map<String, String>> tasks = snapshot.data!;
                          return Column(
                            children: tasks.map((taskData) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: size.height * .01),
                                decoration: BoxDecoration(
                                  color: ColorTheme.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  title: Text(taskData['task']!,
                                      style: GLTextStyles.subheadding2()),
                                  subtitle: Text(
                                      "Customer ID: ${taskData['customerId']}",
                                      style: GLTextStyles.locationtext()),
                                  trailing: Icon(Icons.arrow_forward_ios,
                                      color: ColorTheme.maincolor),
                                  onTap: () {
                                    // Handle task tap
                                  },
                                ),
                              );
                            }).toList(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Fixed bottom container (bottom bar)
          Container(
            height: size.height * .06, // Set container height dynamically
            color: ColorTheme.maincolor, // Background color
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Distribute items evenly
              children: [
                // First Text Widget
                Flexible(
                  flex: 1, // Allow this widget to use available space
                  child: Text(
                    'Total Amount', // First label
                    style: GLTextStyles.subheadding2(color: ColorTheme.white),
                    overflow:
                        TextOverflow.ellipsis, // Avoid overflow by truncating
                  ),
                ),
                // Second Text Widget
                Flexible(
                  flex: 1, // Allow this widget to use available space
                  child: Text(
                    '₹ 00000000000', // Second label
                    style: GLTextStyles.subheadding2(color: ColorTheme.white),
                    textAlign: TextAlign.right, // Align to the right
                    overflow:
                        TextOverflow.ellipsis, // Avoid overflow by truncating
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
