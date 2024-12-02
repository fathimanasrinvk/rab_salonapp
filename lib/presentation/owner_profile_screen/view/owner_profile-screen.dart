import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/common/drawer/custom_drawer.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/text_styles.dart';
import '../../partner_adding_screen/view/partners_adding_screen.dart';
import '../../show_partners_screen/view/show_partners_screen .dart';
import '../controller/owner_profile_controller.dart';

class OwnerProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OwnerProfileController>(context);
    var size = MediaQuery.sizeOf(context);
    List<Map<String, String>> branches = [
      {"branchName": "BRANCH", "location": "DOWNTOWN"},
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildEditableField(
                  "Owner Name",
                  controller.ownerName,
                  (value) => controller.updateField(0, value),
                  size,
                  0,
                  controller),
              SizedBox(height: size.height * 0.02),
              buildEditableField(
                  "Phone Number",
                  controller.phone,
                  (value) => controller.updateField(1, value),
                  size,
                  1,
                  controller),
              SizedBox(height: size.height * 0.02),
              buildEditableField(
                  "Email",
                  controller.email,
                  (value) => controller.updateField(2, value),
                  size,
                  2,
                  controller),
              SizedBox(height: size.height * 0.02),
              buildEditableField(
                  "Aadhar Number",
                  controller.aadhar,
                  (value) => controller.updateField(3, value),
                  size,
                  3,
                  controller),
              SizedBox(height: size.height * 0.04),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorTheme.secondarycolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPartnerScreen(),
                  ),
                ),
                child: Center(
                    child: Text("ADD SALON PARTNERS ",
                        style: GLTextStyles.registertxt2())),
              ),
              SizedBox(height: size.height * 0.02),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorTheme.secondarycolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                ),
                onPressed: () {},
                child: Center(
                    child: Text("MAKE ME AS AN EMPLOYEE",
                        style: GLTextStyles.registertxt2())),
              ),
              SizedBox(height: size.height * 0.02),
              if (controller.partners.isNotEmpty)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.secondarycolor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowPartnersScreen(),
                      ),
                    );
                  },
                  child: Center(
                      child: Text("SHOW PARTNERS",
                          style: GLTextStyles.registertxt2())),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildEditableField(
  String label,
  String value,
  Function(String) onSave,
  Size size,
  int index,
  OwnerProfileController controller,
) {
  return Consumer<OwnerProfileController>(
      builder: (context, controller, child) {
    bool isEditable = controller.editingFieldIndex == index;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.01),
          child: Text(label, style: GLTextStyles.textformfieldtitle()),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.01),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.0355),
            decoration: BoxDecoration(
              color: ColorTheme.white,
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
            child: Row(
              children: [
                // Wrap the editable field with Expanded
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
                          overflow:
                              TextOverflow.ellipsis, // Add overflow handling
                        ),
                ),
                IconButton(
                  icon: Icon(
                    isEditable ? Icons.check : Icons.edit,
                    color: ColorTheme.maincolor,
                  ),
                  onPressed: () {
                    if (isEditable) {
                      controller.editingFieldIndex = null;
                    } else {
                      controller.editingFieldIndex = index;
                    }
                    controller.notifyListeners();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  });
}
