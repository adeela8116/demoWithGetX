import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/authentication_controller.dart';

class SigninView extends GetView {
  SigninView({Key? key}) : super(key: key);
  AuthenticationController authController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            height: Get.height,
            width: Get.width,
            child: Form(
              key: authController.signinFormKey,
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.symmetric(vertical: Get.height/14)),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [Icon(Icons.account_circle, color: Colors.white, size: Get.width/2.5,)],
                            ),
                          ),
                          const SizedBox(
                            child: Center(
                                child: Text("WELCOME", style:
                                TextStyle( fontSize: 20, fontWeight: FontWeight.bold),)
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(
                    height: Get.height/2,
                    child: Column(
                      children: [
                        _textField("email", TextInputType.emailAddress, "Email"),
                        _textField("pass", TextInputType.text, "Password"),
                        TextButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 70, vertical: 20)),
                                textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.black,)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),))
                            ),
                            onPressed: authController.signIn ,
                            child: const Text("Login", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: Get.height/30)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Get.width/14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Do not have an account?", style: TextStyle(fontSize: 16)),
                              TextButton(onPressed: authController.gotoSignUp, child: const Text("SignUp", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
  Widget _textField(String type, TextInputType inputType, String text){
    return SizedBox(
      height: Get.height/10,
      width: Get.width/1.2,
      child: TextFormField(
        controller: type == "pass" ? authController.passTextController.value : authController.emailTextController.value,
        cursorColor: Colors.white,
        keyboardType: inputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: type == "pass" ? true : false,
        validator: (value){
          if (value == null || value.isEmpty) return 'Please enter $text';
          if (type == "email" && !value.contains('@')) return 'Invalid Email!!';
          return null;
        },
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        decoration: InputDecoration(hintText: text,
          helperText: ' ',
          contentPadding: const EdgeInsets.only(bottom: 10),
          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),),
          hintStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
