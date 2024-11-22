import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/text_styles.dart';
import '../../owner_profile/controller/owner_profile_controller.dart';
import '../controller/add_partner_controller.dart';

class AddPartnerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddPartnerController>(context, listen: false);
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: ColorTheme.white,
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        centerTitle: true,
        title: Text('RABLOON', style: GLTextStyles.subheadding()),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextField(
                        "Partner Name",
                        controller.partnerNameController,
                        size,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Partner name is required';
                          }
                          return null;
                        },
                      ),
                      buildTextField(
                        "Email",
                        controller.emailController,
                        size,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      buildTextField(
                        "User Name",
                        controller.userNameController,
                        size,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username is required';
                          }
                          return null;
                        },
                      ),
                      buildTextField(
                        "Password",
                        controller.passwordController,
                        size,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      final partnerDetails = controller.getPartnerDetails();
                      Provider.of<OwnerProfileController>(context, listen: false)
                          .addPartner(partnerDetails);
                      controller.clearFields();
                    }
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
                    width: size.width * 0.45,
                    child: Center(
                      child: Text(
                        'SAVE AND NEW',
                        style: GLTextStyles.saveandnewbutton(),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      final partnerDetails = controller.getPartnerDetails();
                      Provider.of<OwnerProfileController>(context, listen: false)
                          .addPartner(partnerDetails);
                      controller.clearFields();

                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorTheme.maincolor,
                    ),
                    height: size.height * 0.05,
                    width: size.width * 0.45,
                    child: Center(
                      child: Text(
                        'SAVE PARTNER',
                        style: GLTextStyles.onboardingandsavebutton(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, Size size,
      {bool isPassword = false, String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.03),
          child: Text(label, style: GLTextStyles.textformfieldtitle()),
        ),
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
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintStyle: GLTextStyles.textformfieldtext2(),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.015),
              ),
              validator: validator, // Add validation logic
            ),
          ),
        ),
      ],
    );
  }
}
