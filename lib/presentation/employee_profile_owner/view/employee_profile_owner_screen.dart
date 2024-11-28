import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/employee_profile_owner/controller/employee_profile_owner_controller.dart';

class EmployeeProfileOwnerScreen extends StatelessWidget {
  final EmployeeProfileOwnerController controller =
      EmployeeProfileOwnerController();

  // Simulating backend data fetching with customer IDs
  Future<List<Map<String, String>>> fetchTodaysWork() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating network delay
    return [
      {"task": "Customer 1", "customerId": "C001"},
      {"task": "Customer 2", "customerId": "C002"},
      {"task": "Customer 3", "customerId": "C003"},
      {"task": "Customer 4", "customerId": "C004"},
    ]; // Sample tasks with customer IDs
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Scrollable content area
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04, vertical: size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Editable text fields
                  buildEditableField(
                    "Employee Name",
                    controller.employeeName,
                    (value) => controller.updateField(0, value),
                    size,
                    0,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildEditableField(
                    "Username",
                    controller.userName,
                    (value) => controller.updateField(1, value),
                    size,
                    1,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildEditableField(
                    "Password",
                    controller.password,
                    (value) => controller.updateField(2, value),
                    size,
                    2,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "Today's Work",
                    style: GLTextStyles.textformfieldtitle(),
                  ),
                  SizedBox(height: size.height * 0.02),

                  // FutureBuilder for the list of tasks
                  // Now the consumer widget to manage the dynamic content
                  Consumer<EmployeeProfileOwnerController>(
                    builder: (context, controller, child) {
                      return FutureBuilder<List<Map<String, String>>>(
                        future: fetchTodaysWork(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(child: Text('No tasks for today'));
                          } else {
                            List<Map<String, String>> tasks = snapshot.data!;
                            return Column(
                              children: tasks.map((taskData) {
                                int index = tasks.indexOf(taskData);

                                return AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  width: controller.expandedIndex == index
                                      ? size.width * 0.9
                                      : double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      vertical: size.height * 0.01),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.toggleExpandedCard(index);
                                    },
                                    child: Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      color: controller.expandedIndex == index
                                          ? ColorTheme.secondarycolor
                                          : ColorTheme.secondarycolor,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: size.height * 0.02,
                                          horizontal: size.width * 0.04,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        taskData['task'] ?? '',
                                                        style: GLTextStyles
                                                            .onboardbottomcardtxt(
                                                                weight:
                                                                    FontWeight
                                                                        .bold),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      SizedBox(
                                                          height: size.height *
                                                              0.005),
                                                      Text(
                                                        "Customer ID: ${taskData['customerId']}",
                                                        style: GLTextStyles
                                                            .onboardbottomcardtxt(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Icon(
                                                  controller.expandedIndex ==
                                                          index
                                                      ? Icons.expand_less
                                                      : Icons.arrow_forward_ios,
                                                  color: ColorTheme.black,
                                                ),
                                              ],
                                            ),
                                            if (controller.expandedIndex ==
                                                index) ...[
                                              SizedBox(
                                                  height: size.height * 0.02),
                                              Text("Purchased Services",
                                                  style: GLTextStyles
                                                      .textformfieldtext2(
                                                          color: ColorTheme
                                                              .black)),
                                              SizedBox(
                                                  height: size.height * 0.01),
                                              // Ensure the ListView is scrollable horizontally
                                              Container(
                                                height: size.height *
                                                    0.15, // Fixed height for horizontal scroll
                                                child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: 5, // Example data
                                                  itemBuilder:
                                                      (context, serviceIndex) {
                                                    return Container(
                                                      width: size.width *
                                                          0.3, // Set fixed width relative to screen size
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  size.width *
                                                                      0.02),
                                                      decoration: BoxDecoration(
                                                        color: ColorTheme.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            size.width * 0.02),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                "Service ${serviceIndex + 1}",
                                                                style: GLTextStyles
                                                                    .textformfieldtext(
                                                                        color: ColorTheme
                                                                            .black),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis, // Avoid overflow in text
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                " Price : 1234667",
                                                                style: GLTextStyles
                                                                    .textformfieldtext(
                                                                        color: ColorTheme
                                                                            .black),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis, // Avoid overflow in text
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                "Discount  : 12345",
                                                                style: GLTextStyles
                                                                    .textformfieldtext(
                                                                        color: ColorTheme
                                                                            .black),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis, // Avoid overflow in text
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            // // Fixed bottom bar
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * .06,
        color: ColorTheme.maincolor,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Wrap Text in Flexible to prevent overflow
            Flexible(
              child: Text(
                'Total Amount',
                style: GLTextStyles.subheadding2(color: ColorTheme.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Wrap the second Text in Flexible as well
            Flexible(
              child: Text(
                '₹ 00000000000',
                style: GLTextStyles.subheadding2(color: ColorTheme.white),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEditableField(
    String label,
    String value,
    Function(String) onSave,
    Size size,
    int index,
    EmployeeProfileOwnerController controller,
  ) {
    return Consumer<EmployeeProfileOwnerController>(
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
}
