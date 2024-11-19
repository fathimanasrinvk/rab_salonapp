import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/add_employee_screen/controller/add_employee_controller.dart';
import 'package:rab_salon/presentation/add_employee_screen/widget/category_service_listtile.dart';
import 'package:rab_salon/presentation/add_employee_screen/widget/searchbar.dart';

class AddEmployeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final employeeData = Provider.of<AddEmployeeController>(context);

    final List<Map<String, String>> services = [
      {"name": "Hair Color", "category": "Hair", "price": "₹50"},
      {"name": "Hair Color", "category": "Hair", "price": "₹50"},
      {"name": "Haircut", "category": "Hair", "price": "₹30"},
      {"name": "Manicure", "category": "Nail", "price": "₹25"},
      {"name": "Pedicure", "category": "Nail", "price": "₹30"},
      {"name": "Massage", "category": "Body", "price": "₹60"},
      {"name": "Facial", "category": "Skin", "price": "₹45"},
      {"name": "Hair Color", "category": "Hair", "price": "₹50"},
      {"name": "Haircut", "category": "Hair", "price": "₹30"},
      {"name": "Manicure", "category": "Nail", "price": "₹25"},
      {"name": "Pedicure", "category": "Nail", "price": "₹30"},
      {"name": "Massage", "category": "Body", "price": "₹60"},
      {"name": "Facial", "category": "Skin", "price": "₹45"},
      {"name": "Hair Color", "category": "Hair", "price": "₹50"},
      {"name": "Haircut", "category": "Hair", "price": "₹30"},
      {"name": "Manicure", "category": "Nail", "price": "₹25"},
      {"name": "Pedicure", "category": "Nail", "price": "₹30"},
      {"name": "Massage", "category": "Body", "price": "₹60"},
      {"name": "Facial", "category": "Skin", "price": "₹45"},
    ];

    // Group services by category
    Map<String, List<Map<String, String>>> groupedServices() {
      Map<String, List<Map<String, String>>> grouped = {};
      for (var service in services) {
        grouped.putIfAbsent(service['category']!, () => []).add(service);
      }
      return grouped;
    }

    employeeData.setGroupedServices(groupedServices());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('RABLOON', style: GLTextStyles.subheadding()),
            Text('LOCATION', style: GLTextStyles.locationtext()),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.05),
                        child: Text('Add Your Salon Employees',
                            style: GLTextStyles.subheadding2()),
                      ),
                      // Employee Name Field
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.04),
                        child: Text('Employee Name',
                            style: GLTextStyles.textformfieldtitle()),
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
                            onChanged: (value) {
                              employeeData.setEmployeeName(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Your Employee Name',
                              hintStyle: GLTextStyles.textformfieldtext2(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                  vertical: size.height * 0.015),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('User Name',
                                    style: GLTextStyles.textformfieldtitle()),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.014),
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
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        employeeData.setUsername(value);
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'User Name',
                                        hintStyle:
                                            GLTextStyles.textformfieldtext2(),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.05,
                                            vertical: size.height * 0.015),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: size.width * 0.05),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Password',
                                    style: GLTextStyles.textformfieldtitle()),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.014),
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
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        employeeData.setPassword(value);
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle:
                                            GLTextStyles.textformfieldtext2(),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.05,
                                            vertical: size.height * 0.015),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Category List
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
                        child: Text('Service List',
                            style: GLTextStyles.textformfieldtitle()),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
                        child: Text('Service List',
                            style: GLTextStyles.textformfieldtitle()),
                      ),
                      SizedBox(height: size.height * 0.02),

                      SearchBarWidget(
                        onChanged: (value) {
                          // Filter the services based on the search query
                          final filteredServices = services.where((service) {
                            final name = service['name']?.toLowerCase() ?? '';
                            final query = value.toLowerCase();
                            return name.contains(query);
                          }).toList();

                          // Update the filtered services in the controller
                          employeeData.setFilteredServices(filteredServices);
                        },
                        hintText: 'Search Services...',
                      ),

                      SizedBox(height: size.height * 0.02),

                      CategoryServiceList(
                          groupedServices: employeeData.groupedServices),
                    ],
                  ),
                ),
              ),
            ),
            // Positioned buttons at the bottom (optional)
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.02,
                right: size.width * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorTheme.maincolor,
                        width: 1,
                      ),
                      color: ColorTheme.white,
                    ),
                    height: size.height * 0.05,
                    width: size.width * 0.45,
                    child: Center(
                      child: Text('SAVE AND NEW',
                          style: GLTextStyles.saveandnewbutton()),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorTheme.maincolor,
                    ),
                    height: size.height * 0.05,
                    width: size.width * 0.45,
                    child: Center(
                      child: Text('SAVE',
                          style: GLTextStyles.onboardingandsavebutton()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
