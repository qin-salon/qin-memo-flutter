import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TopSnackBar extends HookWidget {
  const TopSnackBar(
      {Key? key,
      required this.content,
      required this.width,
      required this.color})
      : super(key: key);

  final Widget content;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 500));
    final offsetTween = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    );
    final offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCirc,
        reverseCurve: Curves.easeOutCirc,
      ),
    )..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await Future<void>.delayed(const Duration(milliseconds: 1500));
          controller.reverse();
        }
      });

    useEffect(() {
      controller.forward();
    }, []);

    return Align(
      alignment: Alignment.topCenter,
      child: Stack(
        children: <Widget>[
          SlideTransition(
            position: offsetAnimation,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: width,
                  height: 36,
                  child: content,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: color,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
