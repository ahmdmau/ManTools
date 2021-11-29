import 'package:flutter/material.dart';
import 'package:mantools/app/constants/app_colors.dart';
import 'package:mantools/app/constants/app_widgets.dart';

class CustomTextFormField extends StatelessWidget {
  final String titleText;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isObscureText;
  final TextEditingController controller;

  const CustomTextFormField(
      {Key? key,
      required this.titleText,
      required this.hintText,
      required this.validator,
      this.isObscureText = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        plusJakartaText(
          titleText,
          fontSize: 14.0,
          textColor: Colors.grey.shade900,
          fontWeight: FontWeight.w500,
        ),
        TextFormField(
          controller: controller,
          obscureText: isObscureText,
          validator: validator,
          style: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 14.0,
            fontFamily: "PlusJakartaSans",
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
              fontFamily: "PlusJakartaSans",
              fontWeight: FontWeight.w500,
            ),
            fillColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
