import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_shadows.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

import 'text_widgets.dart';

Widget appTextField({
  TextEditingController? textController,
  String text = "",
  String iconName = "",
  String hintText = "Type in your info",
  bool obscureText = false,
  void Function(String value)? func,
}) {
  return Container(
    padding: EdgeInsets.only(right: 25.w, left: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        SizedBox(
          height: 5.h,
        ),
        Container(
          width: 325.w,
          height: 50.h,
          decoration: appBoxDecorationTextField(),
          //row contains icons and textfield
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15.w),
                child: appImage(imagePath: iconName),
              ),
              appTextFieldOnly(
                textController: textController,
                hintText: hintText,
                func: func,
                obscureText: obscureText,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget appTextFieldOnly({
  double width = 275,
  double height = 50,
  String hintText = "Type in your info",
  bool obscureText = false,
  void Function(String value)? func,
  TextEditingController? textController,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextField(
      controller: textController,
      onChanged: (value) => func!(value),
      keyboardType: TextInputType.multiline,
      maxLines: 1,
      autocorrect: false,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 17.h, left: 10.w),
        isDense: true,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        // default border without any input
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        // focus border
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    ),
  );
}
