import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qin_memo/authentication.dart';
import 'package:qin_memo/home_page.dart';
import 'package:qin_memo/webview.dart';
import 'package:qin_memo/reusable_elebvated_button.dart';

class SignupPage extends StatelessWidget {
  Future _googleSignUp(BuildContext context) async {
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
                  onPressed: () => _googleSignUp(context),
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
                  // onPressed:
                ),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '新規登録後、',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFFC2C6D2)),
                  ),
                  TextButton(
                      onPressed: () => {
                        Navigator.of(context).push<WebViewPage>(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const WebViewPage(
                                  title: '利用規約',
                                  url: 'https://memo.qin.sh/');
                            },
                          ),
                        ),
                      },
                      child: const Text(
                        '利用規約',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3B82F6)),
                      )),
                  const Text(
                    'と',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFFC2C6D2)),
                  ),
                  TextButton(
                      onPressed: () => {
                        Navigator.of(context).push<WebViewPage>(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const WebViewPage(
                                  title: 'プライバシーポリシー',
                                  url: 'https://memo.qin.sh/');
                            },
                          ),
                        ),
                      },
                      child: const Text(
                        'プライバシーポリシー',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3B82F6)),
                      )),
                ],
              ),
              const Text(
                'を同意したものとします。',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFFC2C6D2)),
              ),
            ],
          ),
        ));
  }
}

