import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

class ServiceList extends StatefulWidget {
  final List<String> services;
  final Function(String) onTap;

  const ServiceList({
    Key? key,
    required this.services,
    required this.onTap,
  }) : super(key: key);

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Expanded(
      child: ListView.builder(
        itemCount: widget.services.length,
        itemBuilder: (context, index) {
          bool isExpanded = _expandedIndex == index;

          return Padding(
            padding: EdgeInsets.only(bottom: size.height * .016),
            child: Container(
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
              child: Column(
                children: [
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: size.height * .016),
                    title: Center(
                      child: Text(
                        widget.services[index],
                        style: GLTextStyles.categorytext(),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (_expandedIndex == index) {
                          _expandedIndex = null;
                        } else {
                          _expandedIndex = index;
                        }
                      });
                    },
                  ),
                  if (isExpanded)
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .02),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Row 1
                            buildRow(context, size),
                            SizedBox(height: size.height * .01),
                            // Row 2
                            buildRow(context, size),
                            SizedBox(height: size.height * .01),
                            // Row 3
                            buildRow(context, size),
                            SizedBox(height: size.height * .02),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildRow(BuildContext context, Size size) {
    return Container(
      height: size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Add more items as needed
        itemBuilder: (context, rowIndex) {
          return Container(
            width: size.width * .29,
            margin: EdgeInsets.only(right: size.width * .02),
            decoration: BoxDecoration(
              color: ColorTheme.secondarycolor, // Light pink color
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hair Color",
                    style: GLTextStyles.onboardbottomcardtxt(
                        weight: FontWeight.bold)),
                Text("Women",
                    style: GLTextStyles.onboardbottomcardtxt(
                        weight: FontWeight.bold)),
                Text("₹500",
                    style: GLTextStyles.onboardbottomcardtxt(
                        weight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}
