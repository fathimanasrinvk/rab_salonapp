import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/add_branch_screen/widget/custom_inputfield.dart';

class AddBranchScreen extends StatelessWidget {
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController branchLocationController =
      TextEditingController();
  final TextEditingController companyRegistrationNumberController =
      TextEditingController();
  final TextEditingController branchNumberController = TextEditingController();
  final TextEditingController numberofEmployeeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('RABLOON', style: GLTextStyles.subheadding()),
            Text('LOCATION', style: GLTextStyles.locationtext()),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            padding: EdgeInsets.only(
              left: size.width * 0.07,
              right: size.width * 0.07,
              bottom: size.height * 0.08, // Reserve space for the button
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.05),
                  child: Text('Add Your Branches',
                      style: GLTextStyles.subheadding2()),
                ),
                SizedBox(height: size.height * 0.03),
                CustomInputField(
                  labelText: 'Branch Name',
                  hintText: 'Enter Your Branch Name',
                  controller: branchNameController,
                  onChanged: (value) {},
                ),
                SizedBox(height: size.height * 0.03),
                CustomInputField(
                  labelText: 'Branch Location',
                  hintText: 'Enter Your Branch Location',
                  controller: branchLocationController,
                  onChanged: (value) {},
                ),
                SizedBox(height: size.height * 0.03),
                CustomInputField(
                  labelText: 'Company Registration Number',
                  hintText: 'Enter Your Company Registration Number',
                  controller: companyRegistrationNumberController,
                  onChanged: (value) {},
                ),
                SizedBox(height: size.height * 0.03),
                CustomInputField(
                  labelText: 'Branch Number',
                  hintText: 'Enter Your Branch Number',
                  controller: branchNumberController,
                  onChanged: (value) {},
                ),
                SizedBox(height: size.height * 0.03),
                CustomInputField(
                  labelText: 'Number of Employees',
                  hintText: 'Enter Number of Employees',
                  controller: numberofEmployeeController,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          // Fixed position for buttons
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: ColorTheme.white,
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.07,
                vertical: size.height * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Handle Save and New
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorTheme.maincolor,
                            width: 1,
                          ),
                          color: ColorTheme.white,
                        ),
                        height: size.height * 0.05,
                        child: Center(
                          child: Text(
                            'SAVE AND NEW',
                            style: GLTextStyles.saveandnewbutton(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: size.width * 0.05), // Add spacing between buttons
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Handle Save Branch
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorTheme.maincolor,
                        ),
                        height: size.height * 0.05,
                        child: Center(
                          child: Text(
                            'SAVE BRANCH',
                            style: GLTextStyles.onboardingandsavebutton(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
