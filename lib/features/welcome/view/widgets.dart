import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadows.dart';
import 'package:ulearning_app/global.dart';

import '../../../common/widgets/text_widgets.dart';

Widget appOnboardingPage(
  PageController controller,
  BuildContext context, {
  String imagePath = 'assets/images/reading.png',
  String title = '',
  String subTitle = '',
  int index = 0,
}) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin: EdgeInsets.only(top: 5.h),
        child: text24Normal(text: title),
      ),
      Container(
        margin: EdgeInsets.only(top: 5.h),
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: text16Normal(
          text: subTitle,
        ),
      ),
      _nextButton(
        index,
        controller,
        context,
      ),
    ],
  );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      } else {
        // remembers if we are first time or not
        Global.storageService
            .setBool(AppConstants.STORAGE_DEVICE_OPEN_KEY, true);

        Navigator.pushNamed(
          context,
          "/signIn",
        );
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const SignIn(),
        //   ),
        // );
      }
    },
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(top: 90.h, left: 25.w, right: 25.w),
      decoration: appBoxShadow(),
      child: Center(
        child: text16Normal(
          text: index < 3 ? "Next" : "Get Started",
          color: AppColors.primaryBackground,
        ),
      ),
    ),
  );
}
