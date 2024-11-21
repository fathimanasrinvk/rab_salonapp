import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import '../../../core/constants/text_styles.dart';

class PartnersDetailsScreen extends StatelessWidget {
  final Map<String, String> partner;

  const PartnersDetailsScreen({required this.partner, Key? key})
      : super(key: key);

  // Function to show the edit dialog and handle form update
  void _editPartner(BuildContext context) {
    final TextEditingController nameController =
    TextEditingController(text: partner["Partner Name"]);
    final TextEditingController emailController =
    TextEditingController(text: partner["Email"]);
    final TextEditingController usernameController =
    TextEditingController(text: partner["User Name"]);
    final TextEditingController passwordController =
    TextEditingController(text: partner["Password"]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Partner', style: GLTextStyles.subheadding()),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Partner Name"),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: "Username"),
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                ),
              ],
            ),
          ),
          actions: [
        SingleChildScrollView(
        scrollDirection: Axis.horizontal,
          child: Row(
              children:[TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel',style: GLTextStyles.saveandnewbutton(),),
              ),

                TextButton(
                  onPressed: () {
                    // Update the data
                    partner["Partner Name"] = nameController.text;
                    partner["Email"] = emailController.text;
                    partner["User Name"] = usernameController.text;
                    partner["Password"] = passwordController.text;

                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: Text('Save',style: GLTextStyles.saveandnewbutton()),
                ),]),
        ),
        ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              partner["Partner Name"] ?? "",
              style: GLTextStyles.saveandnewbutton(),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              "Email: ${partner["Email"] ?? ""}",
              style: GLTextStyles.textformfieldtitle(),
            ),
            Text(
              "Username: ${partner["User Name"] ?? ""}",
              style: GLTextStyles.textformfieldtitle(),
            ),
            Text(
              "Password: ${partner["Password"] ?? ""}",
              style: GLTextStyles.textformfieldtitle(),
            ),
            SizedBox(height: size.height * 0.02),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => _editPartner(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
