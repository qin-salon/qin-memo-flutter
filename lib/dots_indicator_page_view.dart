import 'package:flutter/material.dart';
import 'package:qin_memo/signup_page.dart';
import 'package:qin_memo/walkthrough_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotsIndicatorPageView extends StatelessWidget {
  final PageController controller = PageController();
  final List<Widget> pages = [
    WalkthroughPage(),
    WalkthroughPage(),
    WalkthroughPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: PageView(
                controller: controller,
                children: pages,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
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
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 56,
              child: ElevatedButton(
                child: const Text(
                  '次へ',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: const Color(0xFFF1F5F9),
                  onPrimary: Colors.black,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  Navigator.of(context).push<Widget>(MaterialPageRoute<Widget>(
                      builder: (BuildContext context) {
                    return SignupPage();
                  }));
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text('すでにアカウントをお持ちの方は こちら')
          ],
        ),
      ),
    );
  }
}
