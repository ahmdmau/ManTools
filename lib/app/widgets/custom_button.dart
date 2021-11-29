import 'package:flutter/material.dart';
import 'package:mantools/app/constants/app_colors.dart';
import 'package:mantools/app/constants/app_widgets.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;

  const CustomButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 0,
        color: AppColors.primaryColor,
        child: plusJakartaText(
          buttonText,
          isCentered: true,
          textColor: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
