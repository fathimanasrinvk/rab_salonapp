import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/presentation/owner_profile_screen/controller/owner_profile_controller.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/text_styles.dart';


class AddedPartnerDetailsScreen extends StatelessWidget {
  final Map<String, String> partnerDetails;
  final int partnerIndex;

  const AddedPartnerDetailsScreen({Key? key, required this.partnerDetails, required this.partnerIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OwnerProfileController>(context);  // Get the controller to access isEditing
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('PARTNER DETAILS', style: GLTextStyles.subheadding()),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(  // Wrap the body with SingleChildScrollView
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.042),
                child: Container(
                  width: size.width * 0.85,
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
                  decoration: BoxDecoration(
                    color: ColorTheme.secondarycolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: partnerDetails.entries.map((entry) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                              child: Text(
                                  entry.key,
                                  style: GLTextStyles.textformfieldtitle()
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Container(
                              width: size.width * 0.75, // Fixed width
                              height: size.height * 0.062, // Fixed height for all containers
                              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                              padding: EdgeInsets.symmetric( horizontal: size.width * 0.04),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 5,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: controller.isEditing
                                    ? TextFormField(
                                  initialValue: entry.value,
                                  onChanged: (value) {
                                    partnerDetails[entry.key] = value; // Update the local partner details
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Edit ${entry.key}',
                                  ),
                                )
                                    : Text(
                                  entry.value,
                                  style: GLTextStyles.textformfieldtext(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05), // To ensure there's enough space at the bottom
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.07, bottom: size.height * 0.03),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: size.width * 0.15,
                    height: size.height * 0.12,
                    decoration: BoxDecoration(
                      color: ColorTheme.secondarycolor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        controller.isEditing ? Icons.save : Icons.edit,
                        color: ColorTheme.maincolor,
                      ),
                      onPressed: () {
                        if (controller.isEditing) {
                          // Save the updated partner if we're in editing mode
                          controller.updatePartner(partnerIndex, partnerDetails);
                        }
                        // Toggle the edit mode
                        controller.toggleEditMode();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
