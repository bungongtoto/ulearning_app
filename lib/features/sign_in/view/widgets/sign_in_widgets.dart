import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget thirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(left: 80.w, right: 80.w, top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _loginButton(imagePath: "assets/icons/google.png"),
        _loginButton(imagePath: "assets/icons/apple.png"),
        _loginButton(imagePath: "assets/icons/facebook.png"),
      ],
    ),
  );
}

Widget _loginButton({required String imagePath}) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 40.h,
      width: 40.w,
      child: Image.asset(imagePath),
    ),
  );
}
