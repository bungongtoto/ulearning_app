import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_text_fields.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/notifier/sigin_in_notifier.dart';
import 'package:ulearning_app/pages/sign_in/sign_in_controller.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';

import '../../common/widgets/app_bar.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  void initState() {
    _controller = SignInController(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // top login buttons
                      thirdPartyLogin(),
                      // more login options message
                      Center(
                        child: text14Normal(
                          text: "Or use your email account to login",
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      appTextField(
                        textController: _controller.emailController,
                        text: "Email",
                        iconName: "assets/icons/user.png",
                        hintText: "Enter your email address",
                        func: (value) {
                          ref
                              .read(signInNotifierProvider.notifier)
                              .onUserEmailChange(value);
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      appTextField(
                        textController: _controller.passwordController,
                        text: "Password",
                        iconName: "assets/icons/lock.png",
                        hintText: "Enter your password",
                        obscureText: true,
                        func: (value) {
                          ref
                              .read(signInNotifierProvider.notifier)
                              .onPasswordChange(value);
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25.w),
                        child: textUnderline(text: "Forgot password?"),
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      // app login button
                      Center(
                        child: appButton(
                          buttonName: "Login",
                          func: () async {
                            await _controller.handleSignIn();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      // app register button
                      Center(
                        child: appButton(
                          buttonName: "Register",
                          isLogin: false,
                          context: context,
                          func: () {
                            Navigator.pushNamed(
                              context,
                              "/signUp",
                            );
                          },
                        ),
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
