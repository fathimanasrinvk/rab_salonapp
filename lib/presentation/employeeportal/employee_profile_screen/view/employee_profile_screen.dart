import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/presentation/employeeportal/show_my_woerks_screen/view/show_my_works_screen.dart';
import '../../../../core/constants/text_styles.dart';
import '../widget/employee_profile_card.dart';

class EmployeeProfileScreen extends StatelessWidget {
  const EmployeeProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('RABLOON', style: GLTextStyles.subheadding()),
            Text('KOCHI', style: GLTextStyles.locationtext()),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
        //   onPressed:(){},
        // ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.035),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             EmployeeProfileCard(label: 'Name', value: 'Arul'),
             SizedBox(height: size.height*0.022),
             EmployeeProfileCard(label: 'User Name', value: 'Aru123I'),
            SizedBox(height: size.height*0.022),
             EmployeeProfileCard(label: 'Password', value: '12356'),
            SizedBox(height: size.height*0.022),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ShowMyWorksScreen()));
              },
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: size.width*0.1, vertical: size.height*0.035),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.maincolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  height: size.height * 0.052,
                  child: Center(
                    child: Text(
                      'Show My Works',
                      style: GLTextStyles.registerbuttontext(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

