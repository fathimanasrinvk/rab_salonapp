import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

class BranchListScreen extends StatelessWidget {
  final List<Map<String, String>> subBranches = [
    {"branchName": "CABELLLO", "location": "LOCATION"},
    {"branchName": "CABELLLO", "location": "LOCATION"},
    {"branchName": "CABELLLO", "location": "LOCATION"},
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02),
            Text("Main Branch", style: GLTextStyles.subheadding2()),
            SizedBox(height: size.height * 0.01),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
                horizontal: size.width * 0.04,
              ),
              decoration: BoxDecoration(
                color: ColorTheme.maincolor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("CABELLO",
                      style: GLTextStyles.subheadding(color: ColorTheme.white)),
                  SizedBox(height: size.height * 0.005),
                  Text("LOCATION", style: GLTextStyles.drawerbuttontext()),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Text("Sub Branches", style: GLTextStyles.subheadding2()),
            SizedBox(height: size.height * 0.01),
            Expanded(
              child: ListView.builder(
                itemCount: subBranches.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () => _showAlertDialog(
                      context,
                      subBranches[index]["branchName"]!,
                      subBranches[index]["location"]!,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.02),
                      child: _buildBranchCard(
                        size,
                        subBranches[index]["branchName"]!,
                        subBranches[index]["location"]!,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Alert Dialog Function
  void _showAlertDialog(
      BuildContext context, String branchName, String location) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(16), // Rounded corners for the dialog
          ),
          contentPadding: EdgeInsets.all(0), // Remove default padding
          content: Container(
            width: 250, // Fixed width for the dialog
            height: 150, // Fixed height for the dialog
            padding:
                EdgeInsets.symmetric(vertical: 20), // Adjust internal padding
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Rounded rectangular button
                  ),
                  backgroundColor:
                      ColorTheme.maincolor, // Customize button color
                  padding: EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15), // Adjust button size
                ),
                child: Text(
                  "SWITCH BRANCH",
                  style: GLTextStyles.drawerbuttontext(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBranchCard(Size size, String branchName, String location) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.01,
        horizontal: size.width * 0.04,
      ),
      decoration: BoxDecoration(
        color: ColorTheme.maincolor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(branchName,
              style: GLTextStyles.subheadding(color: ColorTheme.white)),
          SizedBox(height: size.height * 0.005),
          Text(location, style: GLTextStyles.drawerbuttontext()),
        ],
      ),
    );
  }
}
