import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

class CategoryServiceList extends StatelessWidget {
  final Map<String, List<Map<String, String>>> groupedServices;

  CategoryServiceList({required this.groupedServices});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: groupedServices.keys.length,
      itemBuilder: (context, categoryIndex) {
        String category = groupedServices.keys.elementAt(categoryIndex);
        List<Map<String, String>> categoryServices = groupedServices[category]!;

        return Container(
          margin: EdgeInsets.only(bottom: size.height * 0.02),
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
          child: ExpansionTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    category,
                    style: GLTextStyles.categorytext(),
                  ),
                ),
              ],
            ),
            trailing: Icon(
              Icons.expand_more,
              color: Colors.black,
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: Wrap(
                  spacing: size.width * 0.03, // Horizontal spacing between items
                  runSpacing: size.height * 0.02, // Vertical spacing between rows
                  children: categoryServices.map((service) {
                    return Container(
                      width: (size.width - size.width * 0.2) / 3, // Adjust size
                      decoration: BoxDecoration(
                        color: ColorTheme.secondarycolor,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              service["name"]!,
                              style: GLTextStyles.onboardbottomcardtxt(
                                  weight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: size.height * 0.01),
                            Text(
                              "Women", // You can modify this or pass it dynamically
                              style: GLTextStyles.onboardbottomcardtxt(
                                  weight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: size.height * 0.01),
                            Text(
                              service["price"]!,
                              style: GLTextStyles.onboardbottomcardtxt(
                                  weight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
