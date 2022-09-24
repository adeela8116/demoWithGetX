import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  AuthenticationView({Key? key}) : super(key: key);
  AuthenticationController authController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: Get.width/1.2,
                          height: Get.height/16,
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.white),
                                  textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.black,)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),))
                              ),
                              onPressed: authController.gotoSignUp,
                              child: const Text("Create an Account", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: Get.width/1.2,
                          height: Get.height/16,
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                                  textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.black,)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),))
                              ),
                              onPressed: authController.gotoSignIn ,
                              child: const Text("Sign In with Email & Password", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: Get.width/1.2,
                          height: Get.height/16,
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                                  textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.black,)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),))
                              ),
                              onPressed: authController.signInWithGoogle ,
                              child: const Text("Sign In with Google", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: Get.width/1.2,
                          height: Get.height/16,
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                                  textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.black,)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),))
                              ),
                              onPressed: authController.signIn ,
                              child: const Text("Sign In with Facebook", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

}
