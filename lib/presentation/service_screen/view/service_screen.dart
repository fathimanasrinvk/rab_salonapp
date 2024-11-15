import 'package:flutter/material.dart';
import 'package:rab_salon/core/common/drawer/custom_drawer.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/service_screen/widget/category_listtile.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final TextEditingController searchController = TextEditingController();
  List<String> allServices = [
    "Hair Color",
    "Haircut",
    "Manicure",
    "Pedicure",
    "Massage",
    "Facial"
  ];
  List<String> filteredServices = [];
  bool isLoading = false;
  List<Map<String, String>> branches = [
    {"branchName": "Branch 1", "location": "Downtown"},
    {"branchName": "Branch 2", "location": "Uptown"},
  ];

  @override
  void initState() {
    super.initState();
    // Initially show all services
    filteredServices = allServices;

    // Update the filtered list on search input change
    searchController.addListener(() {
      searchServices(searchController.text);
    });
  }

  // Function to search services
  void searchServices(String query) {
    setState(() {
      isLoading = true; // Show loading indicator while searching
    });

    // Simulate a delay for search
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        filteredServices = allServices
            .where((service) =>
                service.toLowerCase().contains(query.toLowerCase()))
            .toList();
        isLoading = false; // Hide loading indicator once the search is done
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      drawer: CustomDrawer(size: size, branches: branches),
      resizeToAvoidBottomInset: false,
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
        padding:
            EdgeInsets.only(left: size.width * .07, right: size.width * .07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Salon Services", style: GLTextStyles.subheadding2()),
            SizedBox(height: size.height * .03),

            // Search bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * .02),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search services...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: ColorTheme.lightgrey),
                ),
              ),
            ),
            SizedBox(height: size.height * .04),

            // Show loading symbol while searching
            if (isLoading) Center(child: CircularProgressIndicator()),

            // Display services list
            if (!isLoading)
              Expanded(
                child: filteredServices.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("No services found. Try a different search."),
                          ],
                        ),
                      )
                    : ServiceList(
                        services: filteredServices,
                        onTap: (service) {
                          print("Tapped on $service");
                        },
                      ),
              ),
          ],
        ),
      ),
      // FloatingActionButton at old position
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: size.height * .05),
        child: FloatingActionButton.extended(
          backgroundColor: ColorTheme.maincolor,
          onPressed: () {},
          label: Text(
            "Add Your Services",
            style: GLTextStyles.flaotingbuttontext(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // Position in the center
    );
  }
}
