import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

class EditableTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String initialText;
  final ValueNotifier<bool> isEditing;

  EditableTextField({
    required this.label,
    required this.controller,
    required this.initialText,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.01),
        Text(label, style: GLTextStyles.textformfieldtitle()),
        SizedBox(height: size.height * 0.01),
        Container(
          padding: EdgeInsets.all(size.width * 0.03),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorTheme.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: isEditing,
                builder: (context, isEditingValue, child) {
                  return Expanded(
                    child: isEditingValue
                        ? TextField(
                            controller: controller,
                            obscureText: label.toLowerCase() == "password"
                                ? true
                                : false,
                            decoration: InputDecoration(
                              hintText: controller.text.isEmpty
                                  ? initialText
                                  : controller.text,
                              border: InputBorder.none,
                            ),
                            autofocus: true,
                          )
                        : Text(
                            controller.text.isEmpty
                                ? initialText
                                : controller.text,
                            style: GLTextStyles.subheadding2(),
                          ),
                  );
                },
              ),
              ValueListenableBuilder<bool>(
                valueListenable: isEditing,
                builder: (context, isEditingValue, child) {
                  return IconButton(
                    icon: Icon(
                      isEditingValue ? Icons.check : Icons.edit,
                      color: ColorTheme.maincolor,
                    ),
                    onPressed: () {
                      if (isEditing.value) {
                        // Save changes
                        isEditing.value = false;
                      } else {
                        // Enable editing
                        isEditing.value = true;
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
