import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import '../../../../core/constants/text_styles.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Employee_profile_screen(),
    );
  }
}

class Employee_profile_screen extends StatelessWidget {
  const Employee_profile_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('RABLOON', style: GLTextStyles.subheadding()),
            Text('KOCHI', style: GLTextStyles.locationtext()),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Non-editable fields as cards
            const ReusableInfoCard(label: 'Your Name', value: 'Arul'),
            const SizedBox(height: 16),
            const ReusableInfoCard(label: 'User Name', value: 'Aru123I'),
            const SizedBox(height: 16),
            const ReusableInfoCard(label: 'Password', value: '12356'),
            const SizedBox(height: 24),
            // Text button with circular border
            Container(
              width: 220,
              decoration: BoxDecoration(
                color:  Color(0xFF4D0F10),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed: () {
                  // Handle "Show my works" action
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  foregroundColor: Colors.white,
                ),
                child:  Text(
                  'Show my works',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Card widget for displaying information
class ReusableInfoCard extends StatelessWidget {
  final String label;
  final String value;

  const ReusableInfoCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding:  EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style:  TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
             SizedBox(height: 4),
            Text(
              value,
              style:  TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
