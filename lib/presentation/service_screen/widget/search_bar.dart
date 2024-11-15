import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/presentation/service_screen/controller/service_screen_controller.dart';

class SearchBarService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final serviceProvider =
        Provider.of<ServiceController>(context, listen: false);
    var size = MediaQuery.sizeOf(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: serviceProvider.searchController,
        decoration: InputDecoration(
          hintText: "Search services...",
          border: InputBorder.none,
          icon: Icon(Icons.search, color: ColorTheme.lightgrey),
        ),
      ),
    );
  }
}