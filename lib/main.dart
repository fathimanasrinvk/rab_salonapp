import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/presentation/add_employee_screen/controller/add_employee_controller.dart';
import 'package:rab_salon/presentation/add_employee_screen/view/add_employee_screen.dart';
import 'package:rab_salon/presentation/bottom_navigation_screen/controller/owner_bottom_navigation_controller.dart';
import 'package:rab_salon/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:rab_salon/presentation/brach_details_screen/controller/branch_details_screen_controller.dart';
import 'package:rab_salon/presentation/brach_details_screen/view/branch_details_screen.dart';
import 'package:rab_salon/presentation/branch_list_screen/controller/branch_list_screen_controller.dart';
import 'package:rab_salon/presentation/company_profile_screen/controller/company_profile_controller.dart';
import 'package:rab_salon/presentation/employee_profile_owner/controller/employee_profile_owner_controller.dart';
import 'package:rab_salon/presentation/employee_profile_owner/view/employee_profile_owner_screen.dart';
import 'package:rab_salon/presentation/employeeportal/employee_bottom_navigation_screen/controller/employee_bottom_navigation_controller.dart';
import 'package:rab_salon/presentation/employeeportal/employee_bottom_navigation_screen/view/employee_bottom_navigation_screen.dart';
import 'package:rab_salon/presentation/employeeportal/employee_customer_screen/controller/employee_customer_screen_controller.dart';
import 'package:rab_salon/presentation/employeeportal/employee_customer_screen/controller/total_and_discount_amount_controller.dart';
import 'package:rab_salon/presentation/employeeportal/employee_customer_screen/view/employee_customer_screen.dart';
import 'package:rab_salon/presentation/employees_screen/view/employees_screen.dart';
import 'package:rab_salon/presentation/owner_profile_screen/controller/owner_profile_controller.dart';
import 'package:rab_salon/presentation/owner_profile_screen/view/owner_profile-screen.dart';
import 'package:rab_salon/presentation/partner_adding_screen/controller/add_partner_controller.dart';
import 'package:rab_salon/presentation/service_adding_screen/view/service_adding_screen.dart';
import 'package:rab_salon/presentation/service_details_screen/controller/service_details_screen_controller.dart';
import 'package:rab_salon/presentation/service_details_screen/view/service_details_screen.dart';
import 'package:rab_salon/presentation/service_screen/controller/service_screen_controller.dart';
import 'package:rab_salon/presentation/splash_screen/view/splash_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AddEmployeeController()),
    ChangeNotifierProvider(create: (_) => OwnerProfileController()),
    ChangeNotifierProvider(create: (_) => AddPartnerController()),
    ChangeNotifierProvider(create: (_) => ServiceScreenController()),
    ChangeNotifierProvider(create: (_) => BranchListScreenController()),
    ChangeNotifierProvider(create: (_) => EmployeeProfileOwnerController()),
    ChangeNotifierProvider(create: (_) => CompanyProfileController()),
    ChangeNotifierProvider(create: (_) => EmployeeBottomNavigationController()),
    ChangeNotifierProvider(create: (_) => EmployeeCustomerScreenController()),
    ChangeNotifierProvider(create: (_) => DiscountProvider()),
    ChangeNotifierProvider(create: (_) => ServiceDetailsScreenController()),
    ChangeNotifierProvider(create: (_) => BranchDetailsScreenController()),
     ChangeNotifierProvider(create: (_) => OwnerBottomNavigationController()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    // home: SplashScreen(),
      //home: StatusNavigationBar()
      // home: OwnerProfileScreen(),
        home: EmployeeProfileOwnerScreen(),
      // home: OnboardingScreen(),
    );
  }
}
