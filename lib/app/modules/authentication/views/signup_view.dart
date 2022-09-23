import 'package:demoproject_with_get_x/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:demoproject_with_get_x/app/modules/authentication/views/authentication_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SignupView extends GetView {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Container(
            height: Get.height,
            width: Get.width,
            child: Form(
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            height: Get.height/3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [Icon(Icons.account_circle, color: Colors.white, size: Get.width/2.5)],
                            ),
                          ),
                          Container(
                            height: Get.height/20,
                            child: Center(
                                child: Text("CREATE YOUR ACCOUNT", style:
                                TextStyle( fontSize: 20, fontWeight: FontWeight.bold),)
                            ),
                          ),
                        ],
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          _textField("email", emailController, TextInputType.emailAddress, "Email"),
                          _textField("pass", passController, TextInputType.text, "Password"),
                          TextButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor: MaterialStateProperty.all(Colors.white),
                                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 70, vertical: 20)),
                                  textStyle: MaterialStateProperty.all(TextStyle(color: Colors.black,)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),))
                              ),
                              onPressed: (){},
                              child: Text("Enter", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: Get.height/30)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: Get.width/14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("Already have an account?", style: TextStyle(fontSize: 16)),
                                TextButton(onPressed: AuthenticationController().gotoSignIn, child: const Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)))
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
  Widget _textField(String type, TextEditingController controller, TextInputType inputType, String text){
    RegExp regexPass = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return SizedBox(
      height: Get.height/10,
      width: Get.width/1.2,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.white,
        keyboardType: inputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: type == "pass" ? true : false,
        validator: (value){
          if (value == null || value.isEmpty) return 'Please enter $text';
          if (type == "email" && !value.contains('@')) return 'Invalid Email!!';
          if(type == "pass"){
            if(value.length < 8) return 'The password must be at least 8 characters.';
            else if(!regexPass.hasMatch(value)){
              return 'Passwords must contain lowercase/uppercase\n'
                  'letters, numbers and a special character.';
            }
          }
          return null;
        },
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        decoration: InputDecoration(hintText: text,
          helperText: ' ',
          contentPadding: EdgeInsets.only(bottom: 10),
          // contentPadding: EdgeInsets.symmetric(vertical: screenSize.height/60),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),),
          hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
