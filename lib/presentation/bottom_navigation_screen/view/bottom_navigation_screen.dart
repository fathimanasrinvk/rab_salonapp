import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/presentation/service_screen/view/service_screen.dart';



class StatusNavigationBar extends StatefulWidget {
  const StatusNavigationBar({super.key});

  @override
  State<StatusNavigationBar> createState() => _StatusNavigationBarState();
}

class _StatusNavigationBarState extends State<StatusNavigationBar> {
  int _selectedIndex = 0;

  
  final List<Widget> _screens = [
    ServiceScreen(),
    Container(
        color: Colors.white, child: Center(child: Text("Attendances Screen"))),
    Container(
        color: Colors.white, child: Center(child: Text("Projects Screen"))),
    Container(
        color: Colors.white, child: Center(child: Text("Reports Screen"))),
    Container(
        color: Colors.white, child: Center(child: Text("Settings Screen"))),
  ];

 
  final List<Map<String, dynamic>> _navItems = [
    {
      "icon": "assets/images/serviceinactivebottom.png",
      "text": "Work Board",
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

 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: _screens[_selectedIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorTheme.maincolor, 
        items: List.generate(_navItems.length, (index) {
          final item = _navItems[index];
          return BottomNavigationBarItem(
            icon: Image.asset(
              _selectedIndex == index ? item["activeIcon"] : item["icon"],
              width: size.width * .06,
              height: size.height * .03,
            ),
            label: item["text"],
           
            backgroundColor: Colors.white,
          );
        }),
        selectedLabelStyle:
            TextStyle(color: _navItems[_selectedIndex]['activeColor']),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedItemColor: _navItems[_selectedIndex]['activeColor'],
        unselectedItemColor: ColorTheme.white,
      ),
    );
  }
}
