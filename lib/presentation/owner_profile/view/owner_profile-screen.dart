import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import '../../partner_adding_screen/view/partners_adding_screen.dart';



class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  // Controllers for each field
  final  ownerController = TextEditingController();
  final  phoneController = TextEditingController();
  final  emailController = TextEditingController();
  final  aadharController = TextEditingController();

  bool isEditingOwner = false;
  bool isEditingPhone = false;
  bool isEditingEmail = false;
  bool isEditingAadhar = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorTheme.white,
        title: Text(
            'RABLOON',
            style: GLTextStyles.subheadding()
        ),centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.height*0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height*0.02),
                _buildEditableField('Owner Name', ownerController, isEditingOwner, () {
                  setState(() {
                    isEditingOwner = !isEditingOwner;
                  });
                }, size),
                SizedBox(height:size.height*0.028),
                _buildEditableField('Phone Number', phoneController, isEditingPhone, () {
                  setState((){
                    isEditingPhone = !isEditingPhone;
                  });
                }, size),
                SizedBox(height:size.height*0.028),
                _buildEditableField('Email', emailController, isEditingEmail, () {
                  setState((){
                    isEditingEmail = !isEditingEmail;
                  });
                }, size),
                SizedBox(height:size.height*0.028),
                _buildEditableField('Aadhar number', aadharController, isEditingAadhar, () {
                  setState(() {
                    isEditingAadhar = !isEditingAadhar;
                  });
                }, size),
                SizedBox(height:size.height*0.07),
                _buildButton(
                  'ADD SALOON PARTNERS',
                  size,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PartnersAddingScreen()),
                    );
                  },
                ),
                SizedBox(height:size.height*0.02),
                _buildButton(
                  'MAKE ME AS AN EMPLOYEE',
                  size,
                      () {
                  },
                ),              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller, bool isEditing, VoidCallback onEditPressed, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GLTextStyles.textformfieldtitle(),
        ),
        SizedBox(height: size.height * 0.01),
        SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: isEditing
                            ? TextFormField(
                          controller: controller,
                          style: GLTextStyles.textformfieldtext2(),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        )
                            : TextField(
                          readOnly: true,
                          controller: controller,
                          style: GLTextStyles.textformfieldtext(),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        color: ColorTheme.maincolor,
                        icon: Icon(isEditing ? Icons.save : Icons.edit),
                        onPressed: () {
                          if (isEditing) {
                            print('$label saved: ${controller.text}');
                          }
                          onEditPressed();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }




  Widget _buildButton(String text, Size size, VoidCallback onPressed){
    return ElevatedButton(
      onPressed: onPressed,
      style:ElevatedButton.styleFrom(
        backgroundColor:ColorTheme.secondarycolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: size.width*0.04),
      ),
      child: Center(
        child: Text(
            text,
            style: GLTextStyles.registertxt2()
        ),
      ),
    );
  }
}