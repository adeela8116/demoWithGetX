import 'package:demoproject_with_get_x/app/modules/authentication/views/authentication_view.dart';
import 'package:demoproject_with_get_x/app/modules/authentication/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationController extends GetxController {
  Rx<TextEditingController> emailTextController = TextEditingController().obs;
  Rx<TextEditingController>  passController = TextEditingController().obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  void gotoSignUp() => Get.to(SignupView());
  void gotoSignIn() => Get.to(AuthenticationView());

  Future signIn() async {
    print("emailController.text: ${emailTextController.value.text}");
    try{
      var response = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextController.value.text.trim(),
          password: passController.value.text.trim()
      );
      print(response);
    } catch(e){
      print(e);
    }
  }
}
