import 'package:flutter/material.dart';

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
      color: Colors.red,
      child: Center(child: Text("Work Board Screen")),
    ),
    Container(
      color: Colors.green,
      child: Center(child: Text("Attendances Screen")),
    ),
    Container(
      color: Colors.blue,
      child: Center(child: Text("Projects Screen")),
    ),
  ];

  // List of icons and text for each bottom navigation item
  final List<Map<String, dynamic>> _navItems = [
    {
      "icon": Image.asset(""), 
      "text": "Work Board",
      "activeIcon": Icons.work_outline, // Active icon when selected
    },
    {
      "icon": Icons.calendar_today, 
      "text": "Attendances",
      "activeIcon": Icons.calendar_today_outlined,
    },
    {
      "icon": Icons.note, 
      "text": "Projects",
      "activeIcon": Icons.note_add_outlined,
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
    return Scaffold(
      body: _screens[_selectedIndex], // Show the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: List.generate(_navItems.length, (index) {
          final item = _navItems[index];
          return BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == index ? item["activeIcon"] : item["icon"], 
              size: 30,
            ),
            label: item["text"],
          );
        }),
      ),
    );
  }
}
