import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/common/drawer/custom_drawer.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/service_screen/controller/service_screen_controller.dart';
import 'package:rab_salon/presentation/service_screen/widget/category_listtile.dart';
import 'package:rab_salon/presentation/service_screen/widget/search_bar.dart';

class ServiceScreen extends StatelessWidget {
  final List<Map<String, String>> branches = [
    {"branchName": "Branch 1", "location": "Downtown"},
    {"branchName": "Branch 2", "location": "Uptown"},
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Consumer<ServiceController>(
                builder: (context, serviceProvider, child) {
                  // Show loading indicator while loading
                  if (serviceProvider.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  // Show message if no services are found
                  if (serviceProvider.filteredServices.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("No services found.",
                              style: GLTextStyles.greytxt()),
                          Text("Add new services to get started!",
                              style: GLTextStyles.greytxt()),
                          SizedBox(height: size.height * 0.02),
                          FloatingActionButton.extended(
                            backgroundColor: ColorTheme.maincolor,
                            onPressed: () {
                              // Action to add services
                            },
                            label: Text(
                              "Add Your Services",
                              style: GLTextStyles.flaotingbuttontext(),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  // Show the service list when data is available
                  return Column(
                    children: [
                      Text("Your Salon Services",
                          style: GLTextStyles.subheadding2()),
                      SizedBox(height: size.height * 0.03),

                      // Search Bar
                      SearchBarService(),
                      SizedBox(height: size.height * 0.04),

                      ServiceList(
                        services: serviceProvider.filteredServices,
                        onTap: (service) {
                          print("Tapped on $service");
                        },
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorTheme.maincolor,
        onPressed: () {
          // Action to add services
        },
        label: Text(
          "Add Your Services",
          style: GLTextStyles.flaotingbuttontext(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
