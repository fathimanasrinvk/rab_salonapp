import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/add_employee_screen/controller/add_employee_controller.dart';

class AddEmployeeScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final controller =
        Provider.of<AddEmployeeController>(context, listen: false);
    // Check if any services exist in the map
    bool hasServices =
        services.values.any((serviceList) => serviceList.isNotEmpty);
    return Scaffold(
      backgroundColor: ColorTheme.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('RABLOON', style: GLTextStyles.subheadding()),
        backgroundColor: ColorTheme.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          child: ListView(
            children: [
              Text("Add Your Employee", style: GLTextStyles.subheadding2()),
              buildTextField(
                "Employee Name",
                controller.employeeNameController,
                "Enter employee's full name",
                size,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Employee name is required';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      "User Name",
                      controller.userNameController,
                      "Enter username",
                      size,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  Expanded(
                    child: buildTextField(
                      "Password",
                      controller.passwordController,
                      "Enter password",
                      size,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Consumer<AddEmployeeController>(
                builder: (context, controller, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.selectedServices.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.03),
                          child: Text("Selected Services",
                              style: GLTextStyles.textformfieldtitle()),
                        ),
                      ...controller.selectedServices.map(
                        (service) => GestureDetector(
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Delete Service",
                                    style: GLTextStyles.textformfieldtitle()),
                                content: Text(
                                    "Are you sure you want to remove this service?",
                                    style: GLTextStyles.textformfieldtitle()),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // Close the dialog
                                    },
                                    child: Text("Cancel",
                                        style:
                                            GLTextStyles.textformfieldtitle()),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      controller.removeService(service);
                                      Navigator.pop(
                                          context); // Close the dialog
                                    },
                                    child: Text("Delete",
                                        style:
                                            GLTextStyles.textformfieldtitle()),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 3,
                            child: Container(
                              color: ColorTheme.secondarycolor,
                              padding: EdgeInsets.all(size.height * 0.01),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Service: $service",
                                    style: GLTextStyles.onboardbottomcardtxt(),
                                  ),
                                  Text(
                                    "Category: Women",
                                    style: GLTextStyles.onboardbottomcardtxt(),
                                  ),
                                  Text(
                                    "Price: ₹500",
                                    style: GLTextStyles.onboardbottomcardtxt(),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Text(
                                    "Enter Percentage:",
                                    style: GLTextStyles.textformfieldtitle(),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: TextFormField(
                                      controller: controller
                                          .percentageControllers[service],
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "Enter percentage",
                                        hintStyle:
                                            GLTextStyles.textformfieldtext2(),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.05,
                                          vertical: size.height * 0.015,
                                        ),
                                      ),
                                      onChanged: (value) {
                                        controller.updateServicePercentage(
                                            service, value);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: size.height * 0.03),
              if (hasServices) ...[
                Text("Service List", style: GLTextStyles.textformfieldtitle()),
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
                          .read<AddEmployeeController>()
                          .updateSearchQuery(query);
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Consumer<AddEmployeeController>(
                  builder: (context, controller, child) {
                    String searchQuery = controller.searchQuery.toLowerCase();
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
                            controller.expandedCategories[category] ?? false;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Card(
                            color: ColorTheme.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 5,
                            child: InkWell(
                              onTap: () => controller.toggleCategory(category),
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
                                            .map((service) => Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 4.0,
                                                    horizontal: 16.0,
                                                  ),
                                                  child: Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    elevation: 3,
                                                    child: InkWell(
                                                      onTap: () {
                                                        controller
                                                            .toggleServiceSelection(
                                                                service);
                                                      },
                                                      child: Container(
                                                        color: controller
                                                                .selectedServices
                                                                .contains(
                                                                    service)
                                                            ? Colors
                                                                .green.shade100
                                                            : ColorTheme
                                                                .secondarycolor,
                                                        padding: EdgeInsets.all(
                                                            size.height * 0.01),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Service: $service",
                                                              style: GLTextStyles
                                                                  .onboardbottomcardtxt(),
                                                            ),
                                                            Text(
                                                              "Category: Women",
                                                              style: GLTextStyles
                                                                  .onboardbottomcardtxt(),
                                                            ),
                                                            Text(
                                                              "Price: ₹500",
                                                              style: GLTextStyles
                                                                  .onboardbottomcardtxt(),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
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
                      "No services added",
                      style: GLTextStyles.bottomtxt2()
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: ColorTheme.white,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.07,
          vertical: size.height * 0.02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // Handle Save and New
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorTheme.maincolor,
                      width: 1,
                    ),
                    color: ColorTheme.white,
                  ),
                  height: size.height * 0.05,
                  child: Center(
                    child: Text(
                      'SAVE AND NEW',
                      style: GLTextStyles.saveandnewbutton(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: size.width * 0.05), // Add spacing between buttons
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.maincolor,
                  ),
                  height: size.height * 0.05,
                  child: Center(
                    child: Text(
                      'SAVE EMPLOYEE',
                      style: GLTextStyles.onboardingandsavebutton(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
    String label,
    TextEditingController controller,
    String hintText,
    Size size, {
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.03),
          child: Text(label, style: GLTextStyles.textformfieldtitle()),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.014),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: GLTextStyles.textformfieldtext2(),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.015,
                ),
              ),
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }
}
