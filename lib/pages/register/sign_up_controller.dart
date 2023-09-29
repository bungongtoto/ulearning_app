import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/pages/register/notifier/register_notifier.dart';
import 'dart:developer' as developer;

class SignUpController {
  late WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    bool check = ref.exists(registerNotifierProvider);
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;
    developer.log('check $check');
    developer.log('name $name');
    developer.log('email $email');
    developer.log('password $password');
    developer.log('repassword $rePassword');

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo(msg: "your name is empty");
      return;
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastInfo(msg: "your name is too short");
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo(msg: "Your email is empty");
      return;
    }
    if (state.password.isEmpty ||
        password.isEmpty ||
        state.rePassword.isEmpty ||
        rePassword.isEmpty) {
      toastInfo(msg: "password required");
      return;
    }
    if ((state.password != state.rePassword) || (password != rePassword)) {
      toastInfo(msg: "Your password did not match");
      return;
    }

    // showing the loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    var context = Navigator.of(ref.context);

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (kDebugMode) {
        developer.log(credential.toString());
      }
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        // get server photo url
        // set user photo url
        toastInfo(
          msg:
              "Asn email has been sent to verify to verify your account. please open that email",
        );
        context.pop();
      }
    } catch (e) {
      if (kDebugMode) {
        developer.log(e.toString());
      }
    }
    // show the register page
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
