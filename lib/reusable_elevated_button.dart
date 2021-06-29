import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:qin_memo/home_page.dart';

class ReusableElevatedButton extends StatelessWidget {
  const ReusableElevatedButton(
      {this.svgPictureAsset,
        this.svgPictureColor,
        required this.buttonTitle,
        required this.buttonFontSize,
        required this.primaryColor,
        required this.onPrimaryColor,
        this.onPressed});

  final String? svgPictureAsset;
  final Color? svgPictureColor;
  final String buttonTitle;
  final double buttonFontSize;
  final Color primaryColor;
  final Color onPrimaryColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (svgPictureAsset != null)
            SvgPicture.asset(
              svgPictureAsset!,
              color: svgPictureColor,
            ),
          const SizedBox(
            width: 12,
          ),
          Text(
            buttonTitle,
            style: TextStyle(fontSize: buttonFontSize, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: primaryColor,
        onPrimary: onPrimaryColor,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
    );
  }
}


