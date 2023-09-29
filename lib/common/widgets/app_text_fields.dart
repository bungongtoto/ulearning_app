import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_shadows.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

import 'text_widgets.dart';

Widget appTextField({
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
              SizedBox(
                width: 270.w,
                height: 50.h,
                child: TextField(
                  onChanged: (value) => func!(value),
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  autocorrect: false,
                  obscureText: obscureText,
                  decoration: InputDecoration(
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
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
