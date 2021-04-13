import 'package:flutter/material.dart';
import 'package:qin_memo/walkthrough_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotsIndicatorPageView extends StatelessWidget {
  final PageController controller = PageController();
  final List<Widget> pages = [WalkthroughPage(), WalkthroughPage()];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView(
          controller: controller,
          children: pages,
        ),
        Positioned.fill(
          bottom: 100,
          child: Container(
            padding: const EdgeInsets.only(top: 8),
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
        )
      ],
    );
  }
}
