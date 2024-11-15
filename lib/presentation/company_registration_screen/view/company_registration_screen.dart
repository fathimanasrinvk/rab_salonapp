import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/company_registration_screen/widget/company_registration_textfield.dart';



class CompanyDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorTheme.maincolor,
              )),
          title: Text("RABLOON", style: GLTextStyles.headding()),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.only(
              top: size.height * .08,
              left: size.width * .05,
              right: size.width * .05),
          child: Column(
            children: [
              Text(
                "Share your company details to get started!",
                style: GLTextStyles.registertxt2(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.04),
              CompanyRegistrationTextField(label: " Enter Company Name"),
              SizedBox(height: size.height * 0.02),
              CompanyRegistrationTextField(label: "Enter Company Address"),
              SizedBox(height: size.height * 0.02),
              CompanyRegistrationTextField(label: "Enter Company Location"),
              SizedBox(height: size.height * 0.02),
              CompanyRegistrationTextField(
                  label: "Enter Company Registration Number"),
              SizedBox(height: size.height * 0.02),
              CompanyRegistrationTextField(label: "Number of Owners"),
              SizedBox(height: size.height * 0.02),
              CompanyRegistrationTextField(label: "Number of Branches"),
              SizedBox(height: size.height * 0.03),
              MaterialButton(
                onPressed: () {},
                color: ColorTheme.maincolor,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minWidth: size.width * .6, 
                height: size.height * .06, 
                child: Text(
                  "Next",
                  style: GLTextStyles.registerbuttontext(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
