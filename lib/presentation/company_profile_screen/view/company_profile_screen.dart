import 'package:flutter/material.dart';
import 'package:rab_salon/core/common/drawer/custom_drawer.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/add_branch_screen/view/add_branch_screen.dart';
import 'package:rab_salon/presentation/company_profile_screen/controller/company_profile_controller.dart';
import 'package:rab_salon/presentation/employee_profile_owner/widget/editable_textfromfield.dart';

import '../../branch_list_screen/view/branch_list_screen.dart';

class CompanyProfileScreen extends StatelessWidget {
  final CompanyProfileController _companyProfileController =
      CompanyProfileController();

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
                  EditableTextField(
                    label: "Company Name",
                    controller: _companyProfileController.companyNameController,
                    initialText: _companyProfileController.initialCompanyName,
                    isEditing: _companyProfileController.isEditingCompanyName,
                    // toggleEditMode:
                    //  _companyProfileController.toggleCompanyNameEditMode,
                  ),
                  SizedBox(height: size.height * 0.01),
                  EditableTextField(
                    label: "Company Registration Number",
                    controller:
                        _companyProfileController.registrationNumberController,
                    initialText:
                        _companyProfileController.initialRegistrationNumber,
                    isEditing:
                        _companyProfileController.isEditingRegistrationNumber,
                    //   toggleEditMode:
                    // _companyProfileController.toggleRegistrationNumber,
                  ),
                  SizedBox(height: size.height * 0.01),
                  EditableTextField(
                    label: "Company Location",
                    controller: _companyProfileController.locationController,
                    initialText: _companyProfileController.initialLocation,
                    isEditing: _companyProfileController.isEditingLocation,
                    // toggleEditMode: _companyProfileController.toggleLocation,
                  ),
                  SizedBox(height: size.height * 0.01),
                  EditableTextField(
                    label: "Number of Owners",
                    controller:
                        _companyProfileController.numberofOwnerController,
                    initialText: _companyProfileController.initialNumberofOwner,
                    isEditing: _companyProfileController.isEditingNumberofOwner,
                    // toggleEditMode:
                    //     _companyProfileController.toggleNumberofOwner,
                  ),
                  SizedBox(height: size.height * 0.01),
                  EditableTextField(
                    label: "Number of Branch",
                    controller:
                        _companyProfileController.numberOfBranchController,
                    initialText:
                        _companyProfileController.initialNumberOfBranch,
                    isEditing:
                        _companyProfileController.isEditingNumberOfBranch,
                    // toggleEditMode:
                    //     _companyProfileController.toggleNumberOfBranch,
                  ),
                  SizedBox(height: size.height * 0.01),
                  EditableTextField(
                    label: "Main Branch",
                    controller: _companyProfileController.mainBranchController,
                    initialText: _companyProfileController.initialMainBranch,
                    isEditing: _companyProfileController.isEditingMainBranch,
                    // toggleEditMode: _companyProfileController.toggleMainBranch,
                  ),
                  SizedBox(height: size.height * 0.01),
                  EditableTextField(
                    label: "Number of Employee",
                    controller:
                        _companyProfileController.numberofEmployeeController,
                    initialText:
                        _companyProfileController.initialNumberofEmployee,
                    isEditing:
                        _companyProfileController.isEditingNumberofEmployee,
                    //    toggleEditMode:
                    //_companyProfileController.toggleNumberofEmployee,
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
                        _companyProfileController.markBranchAsAdded();
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.01),
                  ValueListenableBuilder<bool>(
                    valueListenable: _companyProfileController.isBranchAdded,
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
}
