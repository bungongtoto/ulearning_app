import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_text_fields.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/register/notifier/register_notifier.dart';
import 'package:ulearning_app/pages/register/sign_up_controller.dart';

import '../../common/widgets/app_bar.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(registerNotifierProvider);
    final laoder = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(title: "Sign Up"),
          backgroundColor: Colors.white,
          body: laoder == false
              ? SingleChildScrollView(
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
                        func: (value) {
                          ref
                              .read(registerNotifierProvider.notifier)
                              .onUserNameChange(value);
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      appTextField(
                        text: "Email",
                        iconName: "assets/icons/user.png",
                        hintText: "Enter your email address",
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserEmailChange(value),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      appTextField(
                        text: "Password",
                        iconName: "assets/icons/lock.png",
                        hintText: "Enter your password",
                        obscureText: true,
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onPasswordChange(value),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      appTextField(
                        text: "Confirm Password",
                        iconName: "assets/icons/lock.png",
                        hintText: "Enter your Confirm Password",
                        obscureText: true,
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onRePasswordChange(value),
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
                          func: () async {
                            await _controller.handleSignUp();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: AppColors.primaryElement,
                  ),
                ),
        ),
      ),
    );
  }
}
