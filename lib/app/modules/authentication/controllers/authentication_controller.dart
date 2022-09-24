import 'package:demoproject_with_get_x/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationController extends GetxController {
  late Rx<TextEditingController> emailTextController;
  late Rx<TextEditingController>  passTextController;
  late Rx<TextEditingController> signupEmailTextController;
  late Rx<TextEditingController>  signupPassTextController;
  late GlobalKey<FormState> signinFormKey;
  late GlobalKey<FormState> signupFormKey;

  final count = 0.obs;
  void increment() => count.value++;
  void gotoSignUp() => Get.toNamed(Routes.SIGNUP);
  void gotoSignIn() => Get.toNamed(Routes.AUTHENTICATION);
  void gotoChat() => Get.toNamed(Routes.CHAT);

  @override
  void onInit() {
    super.onInit();
    emailTextController = TextEditingController().obs;
    passTextController = TextEditingController().obs;
    signupEmailTextController = TextEditingController().obs;
    signupPassTextController = TextEditingController().obs;
    signinFormKey = GlobalKey<FormState>();
    signupFormKey = GlobalKey<FormState>();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future signIn() async {
    if(signinFormKey.currentState!.validate()){
      try{
        final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailTextController.value.text.trim(),
            password: passTextController.value.text.trim()
        );
        gotoChat();
        print("Login Successful");
      } on FirebaseAuthException catch(e){
        if(e.code == 'user-not-found') {Get.snackbar("Error", "Email is not found");}
        else if(e.code == 'wrong-password') {Get.snackbar("Error", "You have entered wrong Password");}
      } catch(e){print(e);}
    }
  }
  Future signUp() async {
    if(signupFormKey.currentState!.validate()){
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signupEmailTextController.value.text.trim(),
          password: signupPassTextController.value.text.trim(),
        );
        gotoSignIn();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {Get.snackbar("ERROR", "The password provided is too weak.");}
        else if (e.code == 'email-already-in-use') {Get.snackbar("ERROR", "The account already exists for that email.");}
      } catch (e) {
        print(e);
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
