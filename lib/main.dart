import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/presentation/add_branch_screen/view/add_branch_screen.dart';
import 'package:rab_salon/presentation/add_employee_screen/controller/add_employee_controller.dart';
import 'package:rab_salon/presentation/add_employee_screen/view/add_employee_screen.dart';
import 'package:rab_salon/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:rab_salon/presentation/brach_details_screen/view/branch_details_screen.dart';
import 'package:rab_salon/presentation/branch_list_screen/view/branch_list_screen.dart';
import 'package:rab_salon/presentation/company_profile_screen/view/company_profile_screen.dart';
import 'package:rab_salon/presentation/employee_profile_owner/controller/employee_profile_owner_controller.dart';
import 'package:rab_salon/presentation/employee_profile_owner/view/employee_profile_owner_screen.dart';
import 'package:rab_salon/presentation/employees_screen/view/employees_screen.dart';
import 'package:rab_salon/presentation/service_adding_screen/view/service_adding_screen.dart';
import 'package:rab_salon/presentation/service_screen/controller/service_screen_controller.dart';
import 'package:rab_salon/presentation/service_screen/view/service_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AddEmployeeProvider()),
      ChangeNotifierProvider(create: (_) => ServiceController()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
     home: EmployeeProfileOwnerScreen(),
      // home: OnboardingScreen(),
    );
  }
}
