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
        backgroundColor: ColorTheme.secondarycolor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Text(
                      "RABLOON",
                      style: GLTextStyles.subheadding(),
                    ),
                    Text("LOCATION", style: GLTextStyles.locationtext()),
                  ],
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
                Text(
                  "You haven't added any branches yet. ",
                  style: GLTextStyles.greytxt(),
                ),
                Text(
                  "Please add your branches. ",
                  style: GLTextStyles.greytxt(),
                ),
                SizedBox(
                  height: size.height * .1,
                ),
                MaterialButton(
                  onPressed: () {},
                  color: ColorTheme.maincolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minWidth: size.width * .6,
                  height: size.height * .06,
                  child: Text(
                    "ADD YOUR BRANCHES",
                    style: GLTextStyles.registerbuttontext(),
                  ),
                )
              ],
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
                Text(
                  "No services added yet. Please add your service",
                  style: GLTextStyles.greytxt(),
                ),
                Text(
                  " to get started !",
                  style: GLTextStyles.greytxt(),
                )
              ],
            ),
          ),

          // Positioned FloatingActionButton
          Positioned(
            bottom: size.height * .05, // Position from bottom of screen
            right: size.width * .25,
            left: size.width * .25, // Position from right side of screen
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
