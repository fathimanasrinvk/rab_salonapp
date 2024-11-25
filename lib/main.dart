import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/presentation/add_employee_screen/controller/add_employee_controller.dart';
import 'package:rab_salon/presentation/add_employee_screen/view/add_employee_screen.dart';
import 'package:rab_salon/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:rab_salon/presentation/branch_list_screen/controller/branch_list_screen_controller.dart';
import 'package:rab_salon/presentation/employee_profile_owner/controller/employee_profile_owner_controller.dart';
import 'package:rab_salon/presentation/employee_profile_owner/view/employee_profile_owner_screen.dart';
import 'package:rab_salon/presentation/employees_screen/view/employees_screen.dart';
import 'package:rab_salon/presentation/owner_profile_screen/controller/owner_profile_controller.dart';
import 'package:rab_salon/presentation/partner_adding_screen/controller/add_partner_controller.dart';
import 'package:rab_salon/presentation/service_adding_screen/view/service_adding_screen.dart';
import 'package:rab_salon/presentation/service_screen/controller/service_screen_controller.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AddEmployeeController()),
    ChangeNotifierProvider(create: (_) => OwnerProfileController()),
    ChangeNotifierProvider(create: (_) => AddPartnerController()),
    ChangeNotifierProvider(create: (_) => ServiceScreenController()),
    ChangeNotifierProvider(create: (_) => BranchListScreenController()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: AddEmployeeScreen(),
        home: EmployeeProfileOwnerScreen()
        // home: OwnerProfileScreen(),
        // home: EmployeeProfileOwnerScreen(),
        // home: OnboardingScreen(),
        );
  }
}
