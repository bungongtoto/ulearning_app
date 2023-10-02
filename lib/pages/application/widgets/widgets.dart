import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    label: "Home",
    icon: bottomContainer(),
    activeIcon: bottomContainer(
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    label: "search",
    icon: bottomContainer(
      imagePath: "assets/icons/search2.png",
    ),
    activeIcon: bottomContainer(
      imagePath: "assets/icons/search2.png",
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    label: "search",
    icon: bottomContainer(imagePath: "assets/icons/search2.png"),
    activeIcon: bottomContainer(
      imagePath: "assets/icons/search2.png",
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    label: "search",
    icon: bottomContainer(imagePath: "assets/icons/search2.png"),
    activeIcon: bottomContainer(
      imagePath: "assets/icons/search2.png",
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
  ),
];

Widget bottomContainer({
  double width = 15,
  double height = 15,
  String imagePath = "assets/icons/home.png",
  Color color = AppColors.primaryFourElementText,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: appImageWithColor(
      imagePath: imagePath,
      color: color,
    ),
  );
}
