import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/service_details_screen/controller/service_details_screen_controller.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServiceDetailsScreenController controller =
      ServiceDetailsScreenController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String? selectedGender; // Variable to store selected gender

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        backgroundColor: ColorTheme.white,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('RABLOON', style: GLTextStyles.subheadding()),
            Text('LOCATION', style: GLTextStyles.locationtext()),
          ],
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04, vertical: size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildEditableField(
                    "Service Name",
                    controller.serviceName,
                    (value) => controller.updateField(0, value),
                    size,
                    0,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildEditableField(
                    "Category Name",
                    controller.category,
                    (value) => controller.updateField(0, value),
                    size,
                    1,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildEditableField(
                    "Price",
                    controller.price,
                    (value) => controller.updateField(0, value),
                    size,
                    2,
                    controller,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text('Gender', style: GLTextStyles.textformfieldtitle()),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.014),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                      child: DropdownButtonFormField<String>(
                        dropdownColor: ColorTheme.secondarycolor,
                        isExpanded: true,
                        isDense: true,
                        decoration: InputDecoration(
                          hintText: 'Select',
                          hintStyle: GLTextStyles.textformfieldtext2(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.04,
                            vertical: size.height * 0.01,
                          ),
                          border: InputBorder.none,
                        ),
                        value: selectedGender,
                        items: ['Select', 'Women', 'Men', 'Other']
                            .map((gender) => DropdownMenuItem(
                                  value: gender == 'Select' ? null : gender,
                                  child: Text(gender),
                                ))
                            .toList(),
                        onChanged: (value) {
                          selectedGender = value;
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a gender';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildEditableField(
    String label,
    String value,
    Function(String) onSave,
    Size size,
    int index,
    ServiceDetailsScreenController controller,
  ) {
    return Consumer<ServiceDetailsScreenController>(
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
