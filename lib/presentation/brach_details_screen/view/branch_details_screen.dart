import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/brach_details_screen/controller/branch_details_screen_controller.dart';
import 'package:rab_salon/presentation/employee_profile_owner/widget/editable_textfromfield.dart';

class BranchDetailsScreen extends StatelessWidget {
  final BranchDetailsScreenController controller =
      BranchDetailsScreenController();

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
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04, vertical: size.height * 0.02),
              child: Column(
                children: [
                  buildEditableField(
                    "Branch Name",
                    controller.branchName,
                    (value) => controller.updateField(0, value),
                    size,
                    0,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildEditableField(
                    "Branch Location",
                    controller.branchLocation,
                    (value) => controller.updateField(0, value),
                    size,
                    1,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildEditableField(
                    "Registration Number",
                    controller.registrationNumber,
                    (value) => controller.updateField(0, value),
                    size,
                    2,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildEditableField(
                    "Branch Number",
                    controller.branchNumber,
                    (value) => controller.updateField(0, value),
                    size,
                    3,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildEditableField(
                    "Number of Employee",
                    controller.numberofEmployee,
                    (value) => controller.updateField(0, value),
                    size,
                    4,
                    controller,
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget buildEditableField(
    String label,
    String value,
    Function(String) onSave,
    Size size,
    int index,
    BranchDetailsScreenController controller,
  ) {
    return Consumer<BranchDetailsScreenController>(
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
