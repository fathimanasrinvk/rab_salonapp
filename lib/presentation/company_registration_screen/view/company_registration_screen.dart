import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/company_registration_screen/widget/company_registration_textfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: CompanyDetailsScreen(),
    );
  }
}

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
                Icons.arrow_back,
                color: ColorTheme.maincolor,
              )),
          title: Text("RABELLA", style: GLTextStyles.headding()),
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
              CompanyRegistrationTextField(label: "Company Name"),
              SizedBox(height: size.height * 0.02),
              CompanyRegistrationTextField(label: "Enter Your Address"),
              SizedBox(height: size.height * 0.02),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Select Your Location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                items: ['Location 1', 'Location 2', 'Location 3']
                    .map((location) => DropdownMenuItem(
                          value: location,
                          child: Text(location),
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.02),
              CompanyRegistrationTextField(
                  label: "Enter Your Registration Number"),
              SizedBox(height: size.height * 0.02),
              CompanyRegistrationTextField(label: "Number of Owners"),
              SizedBox(height: size.height * 0.02),
              CompanyRegistrationTextField(label: "Number of Branches"),
              SizedBox(height: size.height * 0.02),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade900,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
