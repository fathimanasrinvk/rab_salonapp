import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/service_screen/controller/service_screen_controller.dart';

class SearchBarService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<ServiceController>(
      builder: (context, serviceProvider, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: TextFormField(
            controller: serviceProvider.searchController,
            onChanged: (query) {
              serviceProvider
                  .searchServices(query); // Trigger the search functionality
            },
            decoration: InputDecoration(
              hintText: 'Search services...',
              hintStyle: GLTextStyles.textformfieldtext2(),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.015,
              ),
              prefixIcon: Icon(Icons.search, color: ColorTheme.maincolor),
            ),
          ),
        );
      },
    );
  }
}
