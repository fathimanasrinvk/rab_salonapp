import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/text_styles.dart';
import '../../owner_profile/controller/owner_profile_controller.dart';
import '../../partners_details_screen/view/partners_details_screen.dart';

class ShowPartnersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OwnerProfileController>(context);
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
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

      itemCount: controller.partners.length,
        itemBuilder: (context, index) {
          final partner = controller.partners[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddedPartnerDetailsScreen(partnerDetails: partner, partnerIndex: index,),
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
