import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/presentation/employeeportal/employee_bottom_navigation_screen/view/employee_bottom_navigation_screen.dart';
import 'package:rab_salon/presentation/employeeportal/employee_profile_screen/view/employee_profile_screen.dart';

import '../../../../core/constants/text_styles.dart';


class ShowMyWorksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorTheme.white,

        appBar: AppBar(
          centerTitle: true,
          title: Text('RABLOON', style: GLTextStyles.subheadding()),
          backgroundColor: ColorTheme.white,

          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>EmployeeStatusNavigationBar())),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.03,left: size.width * 0.1),
              child: Text("Today's Work", style: GLTextStyles.subheadding2()),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.02),
                    child: Card(
                      color: ColorTheme.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding:  EdgeInsets.all(size.height*0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabelText('Customer ID:', '1234',size),
                            _buildLabelText('Completed Works:', 'Layer cut etc....',size),
                            _buildLabelText('Purchase Cost:', '₹ 1500',size),
                            _buildLabelText('Discount Amount:', '₹ 300',size),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: ColorTheme.maincolor,
              padding:  EdgeInsets.all(size.height*0.009),
              child: Column(
                children: [
                  _buildFooterRow('TOTAL AMOUNT', '₹ 1500'),
                  SizedBox(height: size.height*0.003),
                  _buildFooterRow('DISCOUNT AMOUNT', '₹ 1300'),
                ],
              ),
            ),
          ],
        ),
      );
  }

  Widget _buildLabelText(String label, String text,Size size) {
    return Padding(
      padding:  EdgeInsets.only(bottom:size.height*0.015),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
              child: Text('$label ', style: GLTextStyles.cardlabeltext())),
          Flexible(child: Text(text, style: GLTextStyles.cardvaluetext())),
        ],
      ),
    );
  }

  Widget _buildFooterRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 3,
            child: Text(label, style:GLTextStyles.onboardingandsavebutton())),
        Flexible(child: Text(value, style:GLTextStyles.onboardingandsavebutton())),
      ],
    );
  }
}
