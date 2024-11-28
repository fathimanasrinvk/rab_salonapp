import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/common/drawer/custom_drawer.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/add_branch_screen/view/add_branch_screen.dart';
import 'package:rab_salon/presentation/company_profile_screen/controller/company_profile_controller.dart';
import 'package:rab_salon/presentation/employee_profile_owner/widget/editable_textfromfield.dart';

import '../../branch_list_screen/view/branch_list_screen.dart';

class CompanyProfileScreen extends StatelessWidget {
  final CompanyProfileController controller = CompanyProfileController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    List<Map<String, String>> branches = [
      {"branchName": " BRANCH", "location": "DOWNTOWN"},
      {"branchName": "BRANCH", "location": "DOWNTOWN"},
    ];
    return Scaffold(
      backgroundColor: ColorTheme.white,
      drawer: CustomDrawer(size: size, branches: branches),
      appBar: AppBar(
        backgroundColor: ColorTheme.white,
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("RABLOON", style: GLTextStyles.subheadding()),
            Text("LOCATION", style: GLTextStyles.locationtext()),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
              child: Column(
                children: [
                  buildEditableField(
                    "Company Name",
                    controller.companyName,
                    (value) => controller.updateField(1, value),
                    size,
                    0,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildEditableField(
                    "Company Registration No.",
                    controller.companyRegistrationNumber,
                    (value) => controller.updateField(1, value),
                    size,
                    1,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildEditableField(
                    "Company Location",
                    controller.companyLocation,
                    (value) => controller.updateField(1, value),
                    size,
                    2,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildEditableField(
                    "Number of Owners",
                    controller.numberofOwners,
                    (value) => controller.updateField(1, value),
                    size,
                    3,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildEditableField(
                    "Number of Branch",
                    controller.numberofBranch,
                    (value) => controller.updateField(1, value),
                    size,
                    4,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildEditableField(
                    "Main Branch",
                    controller.mainBranch,
                    (value) => controller.updateField(1, value),
                    size,
                    5,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildEditableField(
                    "Number of Employee",
                    controller.numberofEmployee,
                    (value) => controller.updateField(1, value),
                    size,
                    0,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  _buildButton(
                    'ADD  BRANCHES',
                    size,
                    () async {
                      bool? branchAdded = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddBranchScreen(),
                        ),
                      );
                      if (branchAdded == true) {
                        controller.markBranchAsAdded();
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.01),
                  ValueListenableBuilder<bool>(
                    valueListenable: controller.isBranchAdded,
                    builder: (context, isBranchAdded, child) {
                      if (isBranchAdded) {
                        return _buildButton(
                          'SHOW MY BRANCHES',
                          size,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BranchListScreen(),
                              ),
                            );
                          },
                        );
                      }
                      return SizedBox
                          .shrink(); // Show nothing if branch isn't added
                    },
                  ),
                  SizedBox(height: size.height * 0.01),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildButton(String text, Size size, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorTheme.secondarycolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: size.width * 0.04),
      ),
      child: Center(
        child: Text(text,
            style: GLTextStyles.registertxt2(color: ColorTheme.black)),
      ),
    );
  }

  Widget buildEditableField(
    String label,
    String value,
    Function(String) onSave,
    Size size,
    int index,
    CompanyProfileController controller,
  ) {
    return Consumer<CompanyProfileController>(
      builder: (context, controller, child) {
        bool isEditable = controller.editingFieldIndex == index;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: GLTextStyles.textformfieldtitle()),
            SizedBox(height: size.height * 0.01),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.0355),
              decoration: BoxDecoration(
                color: ColorTheme.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: isEditable
                        ? TextFormField(
                            initialValue: value,
                            onChanged: onSave,
                            style: GLTextStyles.textformfieldtext2(),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )
                        : Text(
                            value,
                            style: GLTextStyles.textformfieldtext2(),
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                  IconButton(
                    icon: Icon(
                      isEditable ? Icons.check : Icons.edit,
                      color: ColorTheme.maincolor,
                    ),
                    onPressed: () {
                      controller.editingFieldIndex = isEditable ? null : index;
                      controller.notifyListeners();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
