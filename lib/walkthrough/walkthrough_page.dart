import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qin_memo/signup/signin_page.dart';
import 'package:qin_memo/signup/signup_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:qin_memo/reusable_elebvated_button.dart';

class WalkthroughImageAndText extends StatelessWidget {
  const WalkthroughImageAndText(
      {required this.imagePath,
      required this.title,
      required this.description});

  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          imagePath,
        ),
        const SizedBox(height: 36),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}

class WalkthroughPage extends HookWidget {
  final PageController controller = PageController();
  final List<Widget> pages = [
    const WalkthroughImageAndText(
        imagePath: 'assets/walkthrough-1.svg',
        title: 'シンプルなメモ',
        description: '見出しも画像も使えません\nだからこそ書くことに集中できます'),
    const WalkthroughImageAndText(
      imagePath: 'assets/walkthrough-2.svg',
      title: '簡単に共有ができる',
      description: 'メモを公開したらリンクが自動生成\nTwitterへの共有も簡単です',
    ),
    const WalkthroughImageAndText(
        imagePath: 'assets/walkthrough-3.svg',
        title: '色々なデバイスで使える',
        description: 'メモはクラウドに自動保存されるから\n好きな端末でいつでも続きから書けます'),
  ];

  static const _duration = Duration(milliseconds: 300);
  static const _curve = Curves.ease;
  final _currentIndex = useState(0);

  void _tappedButton(BuildContext context) {
    if (_currentIndex.value == 2) {
      Navigator.of(context).push<SignupPage>(
        MaterialPageRoute<SignupPage>(
          builder: (BuildContext context) {
            return SignupPage();
          },
        ),
      );
    } else {
      controller.animateToPage(_currentIndex.value += 1,
          duration: _duration, curve: _curve);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final _currentIndex = useState(0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F5F9),
      ),
      backgroundColor: const Color(0xFFF1F5F9),
      body: Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(height: 24),
            Expanded(
              flex: 1,
              child: PageView(
                controller: controller,
                children: pages,
                onPageChanged: (int page) {
                  _currentIndex.value = page;
                },
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: const SlideEffect(
                spacing: 6,
                radius: 6,
                dotWidth: 6,
                dotHeight: 6,
                dotColor: Colors.black12,
                activeDotColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 56,
              child: ReusableElevatedButton(
                buttonTitle: _currentIndex.value == 2 ? 'アカウントを登録する' : '次へ',
                buttonFontSize: 16.0,
                primaryColor: const Color(0xFF3B82F6),
                onPrimaryColor: Colors.white,
                onPressed: () => _tappedButton(context),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'すでにアカウントをお持ちの方は',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFFC2C6D2)),
                ),
                TextButton(
                  onPressed: () => {
                    Navigator.of(context).push<SigninPage>(
                      MaterialPageRoute<SigninPage>(
                        builder: (BuildContext context) {
                          return SigninPage();
                        },
                      ),
                    )
                  },
                  child: const Text(
                    'こちら',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF3B82F6)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
