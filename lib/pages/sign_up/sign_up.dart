import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_text_fields.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import '../../common/widgets/app_bar.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                // more register options message
                Center(
                  child: text14Normal(
                    text: "Enter your details below & free sign up",
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                appTextField(
                  text: "User name",
                  iconName: "assets/icons/user.png",
                  hintText: "Enter your user name",
                ),
                SizedBox(
                  height: 20.h,
                ),
                appTextField(
                  text: "Email",
                  iconName: "assets/icons/user.png",
                  hintText: "Enter your email address",
                ),
                SizedBox(
                  height: 20.h,
                ),
                appTextField(
                  text: "Password",
                  iconName: "assets/icons/lock.png",
                  hintText: "Enter your password",
                  obscureText: true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                appTextField(
                  text: "Confirm Password",
                  iconName: "assets/icons/lock.png",
                  hintText: "Enter your Confirm Password",
                  obscureText: true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child: text14Normal(
                      text:
                          "By creating an account you are agreeing with our terms and conditions"),
                ),
                SizedBox(
                  height: 50.h,
                ),
                // app sign up button
                Center(
                  child: appButton(
                    buttonName: "SignUp",
                    context: context,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
