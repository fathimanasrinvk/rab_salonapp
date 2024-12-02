import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/bottom_navigation_screen/controller/owner_bottom_navigation_controller.dart';
import 'package:rab_salon/presentation/company_profile_screen/view/company_profile_screen.dart';
import 'package:rab_salon/presentation/employees_screen/view/employees_screen.dart';
import 'package:rab_salon/presentation/owner_profile_screen/view/owner_profile-screen.dart';
import 'package:rab_salon/presentation/service_screen/view/service_screen.dart';

class OwnerBottomNavigationScreen extends StatelessWidget {
  const OwnerBottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final List<Widget> _screens = [
      ServiceScreen(),
      EmployeesScreen(),
      OwnerProfileScreen(),
      CompanyProfileScreen(),
      Container(
          color: Colors.white, child: Center(child: Text("Settings Screen"))),
    ];
    final List<Map<String, dynamic>> _navItems = [
      {
        "icon": "assets/images/serviceinactivebottom.png",
        "text": "Services",
        "activeIcon": "assets/images/serviceactivebottom.png",
        "activeColor": ColorTheme.black,
        "inactiveColor": ColorTheme.white,
      },
      {
        "icon": "assets/images/employeesinactivebottom.png",
        "text": "Employees",
        "activeIcon": "assets/images/employeesactivebottom.png",
        "activeColor": ColorTheme.black,
        "inactiveColor": ColorTheme.white,
      },
      {
        "icon": "assets/images/ownerinactivebottom.png",
        "text": "Owner",
        "activeIcon": "assets/images/owneractivebottom.png",
        "activeColor": ColorTheme.black,
        "inactiveColor": ColorTheme.white,
      },
      {
        "icon": "assets/images/companyinactivebottom.png",
        "text": "Company",
        "activeIcon": "assets/images/companyactivebottom.png",
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
      body: Consumer<OwnerBottomNavigationController>(
          builder: (context, bottomNavigationcontroller, child) {
        return _screens[bottomNavigationcontroller.selectedIndex];
      }),
      bottomNavigationBar: Consumer<OwnerBottomNavigationController>(
          builder: (context, bottomNavigationcontroller, chile) {
        return BottomNavigationBar(
          currentIndex: bottomNavigationcontroller.selectedIndex,
          onTap: (index) {
            bottomNavigationcontroller.setSelectedIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorTheme.maincolor,
          items: List.generate(_navItems.length, (index) {
            final item = _navItems[index];
            return BottomNavigationBarItem(
                icon: Image.asset(
                  bottomNavigationcontroller.selectedIndex == index
                      ? item["activeIcon"]
                      : item["icon"],
                  width: size.width * .08,
                  height: size.height * .04,
                ),
                label: item["text"],
                backgroundColor: ColorTheme.white);
          }),
          selectedLabelStyle: GLTextStyles.bottomtxt2(),
          unselectedLabelStyle: GLTextStyles.bottomtxt2(),
          selectedItemColor: _navItems[bottomNavigationcontroller.selectedIndex]
              ['activeColor'],
          unselectedItemColor: ColorTheme.white,
        );
      }),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:rab_salon/core/constants/color_constants.dart';
// import 'package:rab_salon/core/constants/text_styles.dart';
// import 'package:rab_salon/presentation/company_profile_screen/view/company_profile_screen.dart';
// import 'package:rab_salon/presentation/employees_screen/view/employees_screen.dart';
// import 'package:rab_salon/presentation/owner_profile_screen/view/owner_profile-screen.dart';
// import 'package:rab_salon/presentation/service_screen/view/service_screen.dart';

// class StatusNavigationBar extends StatefulWidget {
//   const StatusNavigationBar({super.key});

//   @override
//   State<StatusNavigationBar> createState() => _StatusNavigationBarState();
// }

// class _StatusNavigationBarState extends State<StatusNavigationBar> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     ServiceScreen(),
//     EmployeesScreen(),
//     OwnerProfileScreen(),
//     CompanyProfileScreen(),
//     Container(
//         color: Colors.white, child: Center(child: Text("Settings Screen"))),
//   ];

//   final List<Map<String, dynamic>> _navItems = [
//     {
//       "icon": "assets/images/serviceinactivebottom.png",
//       "text": "Services",
//       "activeIcon": "assets/images/serviceactivebottom.png",
//       "activeColor": ColorTheme.black,
//       "inactiveColor": ColorTheme.white,
//     },
//     {
//       "icon": "assets/images/employeesinactivebottom.png",
//       "text": "Employees",
//       "activeIcon": "assets/images/employeesactivebottom.png",
//       "activeColor": ColorTheme.black,
//       "inactiveColor": ColorTheme.white,
//     },
//     {
//       "icon": "assets/images/ownerinactivebottom.png",
//       "text": "Owner",
//       "activeIcon": "assets/images/owneractivebottom.png",
//       "activeColor": ColorTheme.black,
//       "inactiveColor": ColorTheme.white,
//     },
//     {
//       "icon": "assets/images/companyinactivebottom.png",
//       "text": "Company",
//       "activeIcon": "assets/images/companyactivebottom.png",
//       "activeColor": ColorTheme.black,
//       "inactiveColor": ColorTheme.white,
//     },
//     {
//       "icon": "assets/images/settingsinactivebottom.png",
//       "text": "Settings",
//       "activeIcon": "assets/images/settingsactivebottom.png",
//       "activeColor": ColorTheme.black,
//       "inactiveColor": ColorTheme.white,
//     },
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.sizeOf(context);

//     return Scaffold(

//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: ColorTheme.maincolor,
//         items: List.generate(_navItems.length, (index) {
//           final item = _navItems[index];
//           return BottomNavigationBarItem(
//             icon: Image.asset(
//               _selectedIndex == index ? item["activeIcon"] : item["icon"],
//               width: size.width * .06,
//               height: size.height * .03,
//             ),
//             label: item["text"],
//             backgroundColor: Colors.white,
//           );
//         }),
//         selectedLabelStyle: GLTextStyles.bottomtxt2(),
//         unselectedLabelStyle: GLTextStyles.bottomtxt2(),
//         selectedItemColor: _navItems[_selectedIndex]['activeColor'],
//         unselectedItemColor: ColorTheme.white,
//       ),
//     );
//   }
// }
