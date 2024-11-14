import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class StatusNavigationBar extends StatefulWidget {
  const StatusNavigationBar({super.key});

  @override
  State<StatusNavigationBar> createState() => _StatusNavigationBarState();
}

class _StatusNavigationBarState extends State<StatusNavigationBar> {
  late PersistentTabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: tabController,
        screens: _buildScreens(),  // Ensure screens are defined
        items: _navBarsItems(),
        confineToSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }

  // Define the screens
  List<Widget> _buildScreens() {
    return [
      // Dummy screens for each tab
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
  }

  // Define the navigation bar items
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.workspaces_rounded,
          size: 18,
        ),
        title: "Work Board",
        activeColorPrimary: const Color.fromARGB(255, 24, 133, 115),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.sticky_note_2, size: 18),
        title: "Attendances",
        activeColorPrimary: const Color(0xff1c96ac),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.note, size: 18),
        title: "Projects",
        activeColorPrimary: const Color(0xff2c74a4),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
