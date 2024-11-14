import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: CompanyDetailsScreen(),
    );
  }
}

class CompanyDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RABELLA", style: GLTextStyles.headding()),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Share your company details to get started!",
              style: TextStyle(fontSize: 18, color: Colors.brown.shade900),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CustomTextField(label: "Company Name"),
            CustomTextField(label: "Enter Your Address"),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select Your Location",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              items: ['Location 1', 'Location 2', 'Location 3']
                  .map((location) => DropdownMenuItem(
                        value: location,
                        child: Text(location),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 10),
            CustomTextField(label: "Enter Your Registration Number"),
            CustomTextField(label: "Number of Owners"),
            CustomTextField(label: "Number of Branches"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown.shade900,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                "Next",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;

  const CustomTextField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
