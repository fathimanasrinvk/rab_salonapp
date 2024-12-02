import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

class EmployeeProfileCard extends StatelessWidget {
  final String label;
  final String value;

  const EmployeeProfileCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding:  EdgeInsets.symmetric(vertical: size.height*0.01, horizontal: size.width*0.05),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GLTextStyles.greytxt()
            ),
             SizedBox(height: size.height*0.01),
            Text(
              value,
              style: GLTextStyles.textformfieldtitle()
            ),
          ],
        ),
      ),
    );
  }
}
