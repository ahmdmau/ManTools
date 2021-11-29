import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mantools/app/constants/app_colors.dart';

Widget plusJakartaText(
  String text, {
  double fontSize = 16.0,
  double letterSpacing = 0,
  Color textColor = AppColors.primaryTextColor,
  var fontWeight = FontWeight.w400,
  bool isCentered = false,
}) {
  return Text(
    text,
    textAlign: isCentered ? TextAlign.center : TextAlign.left,
    style: TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: "PlusJakartaSans",
      letterSpacing: letterSpacing,
    ),
  );
}

Widget dmSansText(
  String text, {
  double fontSize = 14.0,
  Color textColor = AppColors.primaryTextColor,
  var fontWeight = FontWeight.w400,
  bool isCentered = false,
}) {
  return Text(
    text,
    textAlign: isCentered ? TextAlign.center : TextAlign.left,
    style: GoogleFonts.dmSans(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}

Future showBottomDialog({
  required BuildContext context,
  String? title,
  String? content,
  Widget? titleWidget,
  Widget? contentWidget,
  List<Widget>? actions,
  bool allowBackNavigation = false,
}) {
  assert(title != null || titleWidget != null,
      'title and titleWidget both must not be null');
  assert(content != null || contentWidget != null,
      'content and contentWidget both must not be null');
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    backgroundColor: Colors.white,
    isDismissible: allowBackNavigation,
    builder: (context) => WillPopScope(
      onWillPop: () async => allowBackNavigation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            titleWidget ??
                plusJakartaText(
                  title ?? "",
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
            const SizedBox(height: 16),
            contentWidget ?? dmSansText(content ?? ""),
            const SizedBox(height: 16),
            if (actions != null)
              ...actions
            else
              OutlinedButton(
                child: Text('GOT IT!'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
          ],
        ),
      ),
    ),
  );
}
