import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

class ExpertedServicesWidget extends StatelessWidget {
  final String title;
  final List<Map<String, String>> servicesCustomer;
  final Function(Map<String, String>) onServiceTap;
  final Size size;

  const ExpertedServicesWidget({
    Key? key,
    required this.title,
    required this.servicesCustomer,
    required this.onServiceTap,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GLTextStyles.textformfieldtitle(),
        ),
        SizedBox(height: size.height * 0.02),
        SizedBox(
          height: size.height * 0.15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: servicesCustomer.length,
            itemBuilder: (context, index) {
              final service = servicesCustomer[index];
              return Padding(
                padding: EdgeInsets.only(right: size.width * 0.05),
                child: GestureDetector(
                  onTap: () => onServiceTap(service),
                  child: buildServiceCard(service, size),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildServiceCard(Map<String, String> service, Size size) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 5,
      child: Container(
        width: size.width * 0.3,
        padding: EdgeInsets.all(size.height * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                "Service",
                style: GLTextStyles.onboardbottomcardtxt(),
              ),
            ),
            Flexible(
              child: Text(
                "Category: ",
                style: GLTextStyles.onboardbottomcardtxt(),
              ),
            ),
            Flexible(
              child: Text(
                "Price:",
                style: GLTextStyles.onboardbottomcardtxt(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
