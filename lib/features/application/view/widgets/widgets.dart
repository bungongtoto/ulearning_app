import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/imege_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/home/view/home.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    label: "Home",
    icon: _bottomContainer(),
    activeIcon: _bottomContainer(
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    label: "Search",
    icon: _bottomContainer(
      imagePath: ImageRes.search,
    ),
    activeIcon: _bottomContainer(
      imagePath: ImageRes.search,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    label: "Play",
    icon: _bottomContainer(imagePath: ImageRes.play),
    activeIcon: _bottomContainer(
      imagePath: ImageRes.play,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    label: "Message",
    icon: _bottomContainer(imagePath: ImageRes.message),
    activeIcon: _bottomContainer(
      imagePath: ImageRes.message,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    label: "Profile",
    icon: _bottomContainer(imagePath: ImageRes.person),
    activeIcon: _bottomContainer(
      imagePath: ImageRes.person,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
  ),
];

Widget _bottomContainer({
  double width = 15,
  double height = 15,
  String imagePath = ImageRes.home,
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

Widget appScreens({int index = 0}) {
  // ignore: no_leading_underscores_for_local_identifiers
  List<Widget> _screens = [
    const Home(),
    Center(
      child: appImage(
        imagePath: ImageRes.search,
        width: 250,
        height: 250,
      ),
    ),
    Center(
      child: appImage(
        imagePath: ImageRes.play,
        width: 250,
        height: 250,
      ),
    ),
    Center(
      child: appImage(
        imagePath: ImageRes.message,
        width: 250,
        height: 250,
      ),
    ),
    Center(
      child: appImage(
        imagePath: ImageRes.person,
        width: 250,
        height: 250,
      ),
    ),
  ];
  return _screens[index];
}
