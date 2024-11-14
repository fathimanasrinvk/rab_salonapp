import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

class ServiceScreen extends StatelessWidget {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      // Drawer for the screen
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // AppBar with centered title
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Shrinks the column to fit its contents
            children: [
              Text(
                "RABLOON",
                style: GLTextStyles.subheadding(),
              ),
              Text("LOCATION", style: GLTextStyles.locationtext()),
            ],
          ),
        ),
      ),
      // Stack to position FloatingActionButton
      body: Stack(
        children: [
          // Main body content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("No services added yet. Please add your service"),
                Text(" to get started !")
              ],
            ),
          ),

          // Positioned FloatingActionButton
          Positioned(
            bottom: size.height * .05, // Position from bottom of screen
            right: size.width * .2,
            left: size.width * .2, // Position from right side of screen
            child: FloatingActionButton(
              backgroundColor: ColorTheme.maincolor,
              onPressed: () {},
              child: Text(
                "Add Your Services",
                style: GLTextStyles.flaotingbuttontext(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
