import 'package:flutter/material.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/text_styles.dart';
import '../../partners_details_screen/view/partners_details_screen.dart';

class ShowPartnersScreen extends StatelessWidget {
  final List<Map<String, String>> partners;

  const ShowPartnersScreen({Key? key, required this.partners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('PARTNERS', style: GLTextStyles.subheadding()),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07,vertical: size.height*0.02),
        itemCount: partners.length,
        itemBuilder: (context, index) {
          final partner = partners[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PartnersDetailsScreen(partner: partner),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.022),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorTheme.maincolor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(size.width * 0.034),
                child: Center(
                  child: Text(
                    partner["Partner Name"] ?? "",
                    style: GLTextStyles.parrtnerlist(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
