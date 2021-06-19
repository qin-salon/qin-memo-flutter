import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qin_memo/authentication.dart';
import 'package:qin_memo/home_page.dart';
import 'package:qin_memo/reusable_elebvated_button.dart';

class SigninPage extends StatelessWidget {
  Future _googleSignIn(BuildContext context) async {
    await signInWithGoogle();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<HomePage>(
      builder: (BuildContext context) {
        return HomePage();
      },
    ), (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF1F5F9),
        ),
        backgroundColor: const Color(0xFFF1F5F9),
        body: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              SvgPicture.asset(
                'assets/logo.svg',
              ),
              const SizedBox(
                height: 90,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 56,
                child: ReusableElevatedButton(
                  svgPictureAsset: 'assets/google.svg',
                  buttonTitle: 'Googleでログイン',
                  buttonFontSize: 16,
                  primaryColor: Colors.white,
                  onPrimaryColor: Colors.black,
                  onPressed: () => _googleSignIn(context),
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 56,
                child: const ReusableElevatedButton(
                  svgPictureAsset: 'assets/apple.svg',
                  svgPictureColor: Colors.white,
                  buttonTitle: 'Appleでログイン',
                  buttonFontSize: 16,
                  primaryColor: Colors.black,
                  onPrimaryColor: Colors.white,
                  // onPressed: ,
                ),
              ),
            ],
          ),
        ));
  }
}
