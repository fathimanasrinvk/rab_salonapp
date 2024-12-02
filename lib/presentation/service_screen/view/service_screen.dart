import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/common/drawer/custom_drawer.dart';
import 'package:rab_salon/presentation/service_adding_screen/view/service_adding_screen.dart';
import 'package:rab_salon/presentation/service_details_screen/view/service_details_screen.dart';
import 'package:rab_salon/presentation/service_screen/controller/service_screen_controller.dart';

import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

class ServiceScreen extends StatelessWidget {
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
  List<Map<String, String>> branches = [
    {"branchName": " BRANCH", "location": "DOWNTOWN"},
    {"branchName": "BRANCH", "location": "DOWNTOWN"},
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // Assume services.isEmpty checks if no data is present
    bool noServices = services.isNotEmpty;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: noServices
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Salon Services",
                    style: GLTextStyles.subheadding2(),
                  ),
                  SizedBox(height: size.height * 0.02),
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
                            .read<ServiceScreenController>()
                            .updateSearchQuery(query);
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Expanded(
                    child: Consumer<ServiceScreenController>(
                      builder: (context, controller, child) {
                        String searchQuery =
                            controller.searchQuery.toLowerCase();
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
                          itemCount: filteredCategories.length,
                          itemBuilder: (context, index) {
                            String category = filteredCategories[index];
                            bool isExpanded =
                                controller.expandedCategories[category] ??
                                    false;

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Card(
                                color: isExpanded
                                    ? ColorTheme.maincolor
                                    : ColorTheme.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 5,
                                child: InkWell(
                                  onTap: () {
                                    controller.toggleCategory(category);
                                  },
                                  onLongPress: () {
                                    // Confirm deletion before removing
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        var size = MediaQuery.of(context)
                                            .size; // Get screen size

                                        return AlertDialog(
                                          title: Text(
                                            "Remove Category",
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.bold,
                                                fontSize: size.width * 0.05),
                                          ),
                                          content: Text(
                                            "Are you sure you want to remove the category \"$category\"?",
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.bold,
                                                fontSize: size.width * 0.04),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(
                                                    context); // Dismiss dialog
                                              },
                                              child: Text(
                                                "Cancel",
                                                style: GoogleFonts.lato(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                context
                                                    .read<
                                                        ServiceScreenController>()
                                                    .removeCategory(category);
                                                Navigator.pop(
                                                    context); // Dismiss dialog after deletion
                                              },
                                              child: Text(
                                                "Remove",
                                                style: GoogleFonts.lato(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                category,
                                                style:
                                                    GLTextStyles.categorytext(
                                                        color: isExpanded
                                                            ? ColorTheme.white
                                                            : ColorTheme.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      AnimatedSize(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                        child: Visibility(
                                          visible: isExpanded,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: size.height * .01),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: services[category]!
                                                    .where((service) => service
                                                        .toLowerCase()
                                                        .contains(searchQuery))
                                                    .map((service) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: Card(
                                                            color: ColorTheme
                                                                .white,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            elevation: 3,
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                ServiceDetailsScreen()));
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: ColorTheme
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30)),
                                                                padding: EdgeInsets
                                                                    .all(size
                                                                            .height *
                                                                        0.01),
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
                                                                    IconButton(
                                                                      icon: Icon(
                                                                          Icons
                                                                              .delete,
                                                                          color:
                                                                              ColorTheme.maincolor),
                                                                      onPressed:
                                                                          () {
                                                                        // Handle delete service
                                                                        context.read<ServiceScreenController>().removeService(
                                                                            category,
                                                                            service);
                                                                      },
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
                                        ),
                                      ),
                                      SizedBox(height: size.height * .01)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Text(
                "No services added.\nPlease add your salon services.",
                style: GLTextStyles.bottomtxt2().copyWith(),
                textAlign: TextAlign.center,
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: ColorTheme.maincolor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ServiceAddingScreen(),
              ),
            );
          },
          label: Text(
            "Add Your Services",
            style: GLTextStyles.flaotingbuttontext(),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
