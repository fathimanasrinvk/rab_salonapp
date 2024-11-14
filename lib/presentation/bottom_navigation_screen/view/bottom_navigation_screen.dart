import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';

void main() {
  runApp(MaterialApp(
    home: StatusNavigationBar(),
  ));
}

class StatusNavigationBar extends StatefulWidget {
  const StatusNavigationBar({super.key});

  @override
  State<StatusNavigationBar> createState() => _StatusNavigationBarState();
}

class _StatusNavigationBarState extends State<StatusNavigationBar> {
  int _selectedIndex = 0; // Track the selected tab index

  // List of screens corresponding to the tab index
  final List<Widget> _screens = [
    Container(
        color: Colors.white, child: Center(child: Text("Work Board Screen"))),
    Container(
        color: Colors.white, child: Center(child: Text("Attendances Screen"))),
    Container(
        color: Colors.white, child: Center(child: Text("Projects Screen"))),
    Container(
        color: Colors.white, child: Center(child: Text("Reports Screen"))),
    Container(
        color: Colors.white, child: Center(child: Text("Settings Screen"))),
  ];

  // List of images, text, and color for each bottom navigation item
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

  // Update the selected index when a bottom navigation item is clicked
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: _screens[_selectedIndex], // Show the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorTheme.maincolor, // Change background color
        items: List.generate(_navItems.length, (index) {
          final item = _navItems[index];
          return BottomNavigationBarItem(
            icon: Image.asset(
              _selectedIndex == index ? item["activeIcon"] : item["icon"],
              width: size.width * .06,
              height: size.height * .03,
            ),
            label: item["text"],
            // Change the text color based on selection
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
