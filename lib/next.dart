import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Next extends StatelessWidget {
  const Next({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: TextButton(onPressed: (){Get.back();}, child: Text("BACK", style: TextStyle(color: Colors.white),))),
      ),
    );
  }
}
