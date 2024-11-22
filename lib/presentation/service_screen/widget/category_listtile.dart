// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rab_salon/core/constants/color_constants.dart';
// import 'package:rab_salon/core/constants/text_styles.dart';

// // Provider for managing state
// class ServiceListProvider with ChangeNotifier {
//   int? _expandedIndex;

//   int? get expandedIndex => _expandedIndex;

//   void toggleExpandedIndex(int index) {
//     if (_expandedIndex == index) {
//       _expandedIndex = null; // Collapse if the same service is clicked again
//     } else {
//       _expandedIndex = index;
//     }
//     notifyListeners();
//   }

//   bool isExpanded(int index) {
//     return _expandedIndex == index;
//   }
// }

// class ServiceList extends StatelessWidget {
//   final List<String> services;
//   final Function(String) onTap;

//   const ServiceList({
//     Key? key,
//     required this.services,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;

//     return ChangeNotifierProvider(
//       create: (_) => ServiceListProvider(),
//       child: Column(
//         children: [
//           Consumer<ServiceListProvider>(
//             builder: (context, provider, child) {
//               return ListView.builder(
//                 shrinkWrap: true, // ListView only takes up necessary space
//                 physics:
//                     NeverScrollableScrollPhysics(), // Disable internal scroll
//                 itemCount: services.length,
//                 itemBuilder: (context, index) {
//                   bool isExpanded = provider.isExpanded(index);

//                   return Padding(
//                     padding: EdgeInsets.only(bottom: size.height * .01),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.3),
//                             spreadRadius: 2,
//                             blurRadius: 5,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           ListTile(
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: size.height * .016),
//                             title: Center(
//                               child: Text(
//                                 services[index],
//                                 style: GLTextStyles.categorytext(),
//                               ),
//                             ),
//                             onTap: () {
//                               provider.toggleExpandedIndex(index);
//                               onTap(services[index]); // Callback on tap
//                             },
//                           ),
//                           if (isExpanded)
//                             Column(
//                               children: [
//                                 buildRow(context, size),
//                                 SizedBox(height: size.height * .01),
//                                 buildRow(context, size),
//                                 SizedBox(height: size.height * .01),
//                                 buildRow(context, size),
//                                 SizedBox(height: size.height * .02),
//                               ],
//                             ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildRow(BuildContext context, Size size) {
//     return SizedBox(
//       height: size.height * .2,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 5, // Adjust item count as needed
//         itemBuilder: (context, rowIndex) {
//           return Container(
//             width: size.width * .29,
//             margin: EdgeInsets.only(right: size.width * .01),
//             decoration: BoxDecoration(
//               color: ColorTheme.secondarycolor, // Light pink color
//               borderRadius: BorderRadius.circular(12.0),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Hair Color", style: GLTextStyles.onboardbottomcardtxt()),
//                 Text("Women", style: GLTextStyles.onboardbottomcardtxt()),
//                 Text("₹500", style: GLTextStyles.onboardbottomcardtxt()),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
