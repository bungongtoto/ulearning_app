import 'package:flutter/material.dart';
import 'package:ulearning_app/pages/welcome/widgets.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            children: [
              //first page
              appOnboardingPage(
                _controller,
                imagePath: 'assets/images/reading.png',
                title: 'First See Learning',
                subTitle: 'Forget about of paper all knowledge in one learning',
                index: 1,
              ),
              appOnboardingPage(
                _controller,
                imagePath: 'assets/images/man.png',
                title: 'Connect With Everyone',
                subTitle:
                    "Always keep in touch with your tutor and friends. let's get connected",
                index: 2,
              ),
              appOnboardingPage(
                _controller,
                imagePath: 'assets/images/boy.png',
                title: 'Always Facinated Learning',
                subTitle:
                    "Anywhere, anytime. The time is at your discretion. So study wherever you can",
                index: 3,
              ),
            ],
          ),
          const Positioned(
            bottom: 100,
            left: 20,
            child: Text(''),
          ),
        ],
      ),
    );
  }
}
