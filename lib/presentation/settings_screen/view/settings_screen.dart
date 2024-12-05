import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // List of titles for tiles
    final List<String> tileTitles = [
      'Change Password',
      'Privacy Policy',
      'Terms And Conditions',
      'About Us',
    ];

    // List of routes or dummy screens
    final List<Widget> screens = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.white,
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("RABLOON", style: GLTextStyles.subheadding()),
          ],
        ),
      ),
      backgroundColor: ColorTheme.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(size.width * .05),
              child: ListView.builder(
                itemCount: tileTitles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.01), // Spacing between items
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => screens[index],
                        //   ),
                        // );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // Shadow offset
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(tileTitles[index],
                              style: GLTextStyles.categorytext()),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // App version text at the bottom
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: Text(
              'App Version 1.0.0',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy screens
