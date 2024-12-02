import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/company_profile_screen/view/company_profile_screen.dart';
import 'package:rab_salon/presentation/employeeportal/employee_bottom_navigation_screen/controller/employee_bottom_navigation_controller.dart';
import 'package:rab_salon/presentation/employeeportal/employee_work_screen/view/employee_work_screen.dart';
import 'package:rab_salon/presentation/employees_screen/view/employees_screen.dart';
import 'package:rab_salon/presentation/service_screen/view/service_screen.dart';

import '../../employee_profile_screen/view/employee_profile_screen.dart';


class EmployeeStatusNavigationBar extends StatelessWidget {
  const EmployeeStatusNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    // Screens list for navigation
    final List<Widget> _screens = [
      EmployeeWorkScreen(),
      EmployeeProfileScreen(),
      Container(
          color: Colors.white, child: Center(child: Text("Settings Screen"))),
    ];

    // Navigation items configuration
    final List<Map<String, dynamic>> _navItems = [
      {
        "icon": "assets/images/workinactive.png",
        "text": "Works",
        "activeIcon": "assets/images/worksactive.png",
        "activeColor": ColorTheme.black,
        "inactiveColor": ColorTheme.white,
      },
      {
        "icon": "assets/images/profileinactive.png",
        "text": "Profile",
        "activeIcon": "assets/images/profielactive.png",
        "activeColor": ColorTheme.black,
        "inactiveColor": ColorTheme.white,
      },
      {
        "icon": "assets/images/settingsinactivebottom.png",
        "text": "Settings",
        "activeIcon": "assets/images/settingsactivebottom.png",
        "activeColor": ColorTheme.black,
        "inactiveColor": ColorTheme.white,
      },
    ];

    return Scaffold(
      body: Consumer<EmployeeBottomNavigationController>(
        builder: (context, navigationProvider, child) {
          return _screens[navigationProvider.selectedIndex];
        },
      ),
      bottomNavigationBar: Consumer<EmployeeBottomNavigationController>(
        builder: (context, navigationProvider, child) {
          return BottomNavigationBar(
            currentIndex: navigationProvider.selectedIndex,
            onTap: (index) {
              // Update the selected index using the provider
              navigationProvider.setSelectedIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorTheme.maincolor,
            items: List.generate(_navItems.length, (index) {
              final item = _navItems[index];
              return BottomNavigationBarItem(
                icon: Image.asset(
                  navigationProvider.selectedIndex == index
                      ? item["activeIcon"]
                      : item["icon"],
                  width: size.width * .08,
                  height: size.height * .04,
                ),
                label: item["text"],
                backgroundColor: Colors.white,
              );
            }),
            selectedLabelStyle: GLTextStyles.bottomtxt2(),
            unselectedLabelStyle: GLTextStyles.bottomtxt2(),
            selectedItemColor: _navItems[navigationProvider.selectedIndex]
                ['activeColor'],
            unselectedItemColor: ColorTheme.white,
          );
        },
      ),
    );
  }
}
