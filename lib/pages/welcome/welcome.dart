import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/welcome/notifier/welcome_notifier.dart';
import 'package:ulearning_app/pages/welcome/widgets.dart';

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  onPageChanged: (value) {
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    //first page
                    appOnboardingPage(
                      _controller,
                      context,
                      imagePath: 'assets/images/reading.png',
                      title: 'First See Learning',
                      subTitle:
                          'Forget about of paper all knowledge in one learning',
                      index: 1,
                    ),
                    appOnboardingPage(
                      _controller,
                      context,
                      imagePath: 'assets/images/man.png',
                      title: 'Connect With Everyone',
                      subTitle:
                          "Always keep in touch with your tutor and friends. let's get connected",
                      index: 2,
                    ),
                    appOnboardingPage(
                      _controller,
                      context,
                      imagePath: 'assets/images/boy.png',
                      title: 'Always Facinated Learning',
                      subTitle:
                          "Anywhere, anytime. The time is at your discretion. So study wherever you can",
                      index: 3,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 35.h,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.w))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
