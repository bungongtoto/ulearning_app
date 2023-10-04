import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/entities/user.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/features/sign_in/provider/sigin_in_notifier.dart';
import 'package:ulearning_app/features/sign_in/repo/sign_in_repo.dart';
import 'package:ulearning_app/global.dart';
import 'dart:developer' as developer;

import 'package:ulearning_app/main.dart';

class SignInController {
  // WidgetRef ref;
  SignInController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    developer.log('name: $email');
    developer.log('passsword: $password');

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo(msg: "Your email is empty");
      return;
    }
    if (state.password.isEmpty || password.isEmpty) {
      toastInfo(msg: "Your password is empty");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      final credential =
          await SignInRepo.firebaseSignIn(email: email, password: password);
      if (credential.user == null) {
        toastInfo(msg: "User not found");
        return;
      }
      if (!credential.user!.emailVerified) {
        toastInfo(msg: "You must verify your email address first !");
        return;
      }
      var user = credential.user;
      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity(
          type: 1,
          avatar: photoUrl,
          name: displayName,
          email: email,
          open_id: id,
        );

        asyncPostAllData(loginRequestEntity);
        developer.log("user logged in");
      } else {
        toastInfo(msg: "Login error");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo(msg: "user not found");
      } else if (e.code == 'wrong-password') {
        toastInfo(msg: "Your password is wrong");
      }
      developer.log(e.code);
    } catch (e) {
      if (kDebugMode) {
        developer.log(e.toString());
      }
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    // we need to talk to server
    // have a local storage
    try {
      //var navigator = Navigator.of(ref.context);
      // try to remember user info
      Global.storageService.setString(
        AppConstants.STORAGE_USER_PROFILE_KEY,
        "123",
      );
      Global.storageService.setString(
        AppConstants.STORAGE_USER_TOKEN_KEY,
        "123456",
      );

      navKey.currentState
          ?.pushNamedAndRemoveUntil("/application", (route) => false);

      // navigator.push(MaterialPageRoute(
      //     builder: (BuildContext context) => Scaffold(
      //           appBar: AppBar(),
      //           body: const Application(),
      //         )));

      // navigator.pushNamed("/application");
    } catch (e) {
      if (kDebugMode) {
        developer.log(e.toString());
      }
    }
    // redirect to new page
  }
}
