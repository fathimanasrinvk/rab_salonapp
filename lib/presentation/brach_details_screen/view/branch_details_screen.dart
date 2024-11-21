import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/brach_details_screen/controller/branch_details_controller.dart';
import 'package:rab_salon/presentation/employee_profile_owner/widget/editable_textfromfield.dart';

class BranchDetailsScreen extends StatelessWidget {
  final BranchDetailsController _branchDetailsController =
      BranchDetailsController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

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
        backgroundColor: ColorTheme.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
          onPressed: () => Navigator.pop(context),
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
                    label: "Branch Name",
                    controller: _branchDetailsController.branchNameController,
                    initialText: _branchDetailsController.initialBranchName,
                    isEditing: _branchDetailsController.isEditingBranchName,
                     
                  ),
                  SizedBox(height: size.height * 0.01),
                  EditableTextField(
                    label: "Branch Location",
                    controller:
                        _branchDetailsController.branchLocationController,
                    initialText: _branchDetailsController.initialBranchLocation,
                    isEditing: _branchDetailsController.isEditingBranchLocation,
                   
                  ),
                  SizedBox(height: size.height * 0.01),
                  EditableTextField(
                    label: "Registration Number",
                    controller: _branchDetailsController
                        .branchregistrationNumberController,
                    initialText: _branchDetailsController
                        .initialBranchregistrationNumber,
                    isEditing: _branchDetailsController
                        .isEditingBranchregistrationNumber,
                    
                  ),
                  SizedBox(height: size.height * 0.01),
                  EditableTextField(
                    label: "Branch Number",
                    controller: _branchDetailsController.branchNumberController,
                    initialText: _branchDetailsController.initialBranchNumber,
                    isEditing: _branchDetailsController.isEditingBranchNumber,
                  ),
                  SizedBox(height: size.height * 0.01),
                  EditableTextField(
                    label: "Number of Employee",
                    controller:
                        _branchDetailsController.numberofEmployeeController,
                    initialText:
                        _branchDetailsController.initialNumberofEmployee,
                    isEditing:
                        _branchDetailsController.isEditingNumberofEmployee,
                  
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
}
