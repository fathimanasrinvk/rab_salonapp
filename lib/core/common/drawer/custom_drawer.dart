import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

class CustomDrawer extends StatelessWidget {
  final Size size;
  final List<Map<String, String>> branches;

  const CustomDrawer({Key? key, required this.size, required this.branches})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Drawer(
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
            ),
          ),
          if (branches.isEmpty) ...[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * .1),
                Text(
                  "You haven't added any branches yet.",
                  style: GLTextStyles.greytxt(),
                ),
                Text(
                  "Please add your branches.",
                  style: GLTextStyles.greytxt(),
                ),
                SizedBox(height: size.height * .1),
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
                    style: GLTextStyles.drawerbuttontext(),
                  ),
                ),
              ],
            ),
          ] else ...[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Switch to Another Branch",
                  style: GLTextStyles.subheadding2(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * .05),
                for (var branch in branches) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .03,
                        vertical: size.height * .01),
                    child: MaterialButton(
                      onPressed: () {},
                      color: ColorTheme.maincolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      minWidth: size.width * .06,
                      height: size.height * .06,
                      child: Column(
                        children: [
                          Text(
                            branch['branchName'] ?? '',
                            style: GLTextStyles.drawerbuttontext(),
                          ),
                          Text(
                            branch['location'] ?? '',
                            style: GLTextStyles.drawerbuttontext(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}
