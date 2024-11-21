import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Mock Data Model for Service
class Service {
  final String name;
  final String category;
  final String price;

  Service({required this.name, required this.category, required this.price});
}

// Provider for managing state
class AddEmployeeProvider with ChangeNotifier {
  int? expandedCategoryIndex;

  void toggleCategoryExpansion(int index) {
    if (expandedCategoryIndex == index) {
      expandedCategoryIndex =
          null; // Collapse if the same category is clicked again
    } else {
      expandedCategoryIndex = index;
    }
    notifyListeners();
  }

  bool isCategoryExpanded(int index) {
    return expandedCategoryIndex == index;
  }
}

class AddEmployeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mock service data grouped by categories
    Map<String, List<Service>> categoryServices = {
      "Hair Services": [
        Service(name: "Haircut", category: "Hair Services", price: "\$15"),
        Service(name: "Shave", category: "Hair Services", price: "\$10"),
      ],
      "Nail Services": [
        Service(name: "Manicure", category: "Nail Services", price: "\$20"),
        Service(name: "Pedicure", category: "Nail Services", price: "\$25"),
      ],
      "Skin Services": [
        Service(name: "Facial", category: "Skin Services", price: "\$30"),
        Service(name: "Peel", category: "Skin Services", price: "\$35"),
      ],
    };

    return ChangeNotifierProvider(
      create: (context) => AddEmployeeProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('RABLOON',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('LOCATION',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {},
          ),
        ),
        body: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Add Your Employees',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            // Flexible Category List
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Consumer<AddEmployeeProvider>(
                  builder: (context, provider, child) {
                    return ListView.builder(
                      itemCount: categoryServices.keys.length,
                      itemBuilder: (context, index) {
                        String category =
                            categoryServices.keys.elementAt(index);
                        bool isExpanded = provider.isCategoryExpanded(index);

                        return GestureDetector(
                          onTap: () {
                            provider.toggleCategoryExpansion(index);
                          },
                          child: Card(
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Category Header
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(category,
                                          style: TextStyle(fontSize: 16)),
                                      Icon(
                                        isExpanded
                                            ? Icons.expand_less
                                            : Icons.expand_more,
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                  // Expanded Services Grid
                                  if (isExpanded)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxHeight:
                                              200, // Adjust maxHeight as per your design.
                                        ),
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 8.0,
                                            mainAxisSpacing: 8.0,
                                            childAspectRatio: 3 / 2,
                                          ),
                                          itemCount: categoryServices[category]!
                                              .length,
                                          itemBuilder: (context, gridIndex) {
                                            Service service = categoryServices[
                                                category]![gridIndex];
                                            return Card(
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(service.name,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14)),
                                                    SizedBox(height: 4),
                                                    Text(service.price,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.grey)),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rab_salon/core/constants/color_constants.dart';
// import 'package:rab_salon/core/constants/text_styles.dart';
// import 'package:rab_salon/presentation/add_employee_screen/controller/add_employee_controller.dart';

// class AddEmployeeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Mock data from backend (replace this with actual data from the backend)

//     // Mock data from backend (replace this with actual data from the backend)
//     List<Map<String, dynamic>> serviceList = [
//       {
//         "category": "Hair Services",
//         "services": ["Haircut", "Hair Coloring", "Hair Spa"]
//       },
//       {
//         "category": "Nail Services",
//         "services": ["Manicure", "Pedicure", "Nail Art"]
//       },
//       {
//         "category": "Skin Services",
//         "services": ["Facial", "Waxing", "Threading"]
//       },
//     ];

//     var size = MediaQuery.of(context).size;

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: ColorTheme.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text('RABLOON', style: GLTextStyles.subheadding()),
//             Text('LOCATION', style: GLTextStyles.locationtext()),
//           ],
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
//           onPressed: () {},
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: size.height * 0.05),
//                       child: Text('Add Your Salon Employees',
//                           style: GLTextStyles.subheadding2()),
//                     ),
//                     // Employee Name Field
//                     Padding(
//                       padding: EdgeInsets.only(top: size.height * 0.04),
//                       child: Text('Employee Name',
//                           style: GLTextStyles.textformfieldtitle()),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: size.height * 0.014),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(8.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.1),
//                               spreadRadius: 2,
//                               blurRadius: 4,
//                               offset: Offset(5, 5),
//                             ),
//                           ],
//                         ),
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             hintText: 'Enter Your Employee Name',
//                             hintStyle: GLTextStyles.textformfieldtext2(),
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: size.width * 0.05,
//                                 vertical: size.height * 0.015),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.03),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('User Name',
//                                   style: GLTextStyles.textformfieldtitle()),
//                               Padding(
//                                 padding:
//                                     EdgeInsets.only(top: size.height * 0.014),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black.withOpacity(0.1),
//                                         spreadRadius: 2,
//                                         blurRadius: 4,
//                                         offset: Offset(5, 5),
//                                       ),
//                                     ],
//                                   ),
//                                   child: TextFormField(
//                                     keyboardType: TextInputType.text,
//                                     decoration: InputDecoration(
//                                       hintText: 'User Name',
//                                       hintStyle:
//                                           GLTextStyles.textformfieldtext2(),
//                                       border: InputBorder.none,
//                                       contentPadding: EdgeInsets.symmetric(
//                                           horizontal: size.width * 0.05,
//                                           vertical: size.height * 0.015),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: size.width * 0.05),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Password',
//                                   style: GLTextStyles.textformfieldtitle()),
//                               Padding(
//                                 padding:
//                                     EdgeInsets.only(top: size.height * 0.014),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(8.0),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black.withOpacity(0.1),
//                                         spreadRadius: 2,
//                                         blurRadius: 4,
//                                         offset: Offset(5, 5),
//                                       ),
//                                     ],
//                                   ),
//                                   child: TextFormField(
//                                     obscureText: true,
//                                     decoration: InputDecoration(
//                                       hintText: 'Password',
//                                       hintStyle:
//                                           GLTextStyles.textformfieldtext2(),
//                                       border: InputBorder.none,
//                                       contentPadding: EdgeInsets.symmetric(
//                                           horizontal: size.width * 0.05,
//                                           vertical: size.height * 0.015),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: size.height * 0.03),
//                     Text('Service List',
//                         style: GLTextStyles.textformfieldtitle()),
//                     SizedBox(height: size.height * 0.02),
//                     // Service List
//                     ListView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true, // Ensures it fits in available space
//                       itemCount: serviceList.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           margin: EdgeInsets.symmetric(
//                               vertical: size.height * 0.005),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12.0),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 spreadRadius: 1,
//                                 blurRadius: 5,
//                                 offset: Offset(2, 2),
//                               ),
//                             ],
//                           ),
//                           child: ExpansionTile(
//                             title: Text(
//                               serviceList[index]["category"],
//                               style: GLTextStyles.textformfieldtitle(),
//                             ),
//                             children: serviceList[index]["services"]
//                                 .map<Widget>(
//                                   (service) => Card(
//                                     margin: EdgeInsets.symmetric(
//                                         vertical: size.height * 0.005,
//                                         horizontal: size.width * 0.05),
//                                     child: Padding(
//                                       padding:
//                                           EdgeInsets.all(size.width * 0.03),
//                                       child: Text(
//                                         service,
//                                         style: GLTextStyles.subheadding2(),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                                 .toList(),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
