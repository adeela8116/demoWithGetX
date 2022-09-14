import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.dart';
import 'next.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _widget("assets/images/call.png", Next()),
            _widget("assets/images/cam.png", Next()),
            _widget("assets/images/msg.png", MyApp()),
            _widget("assets/images/grp.png", Next()),
          ],
        ),
      ),
    );
  }
  Widget _widget(var icon, var page){
    return IconButton(onPressed: (){Get.to(page);}, iconSize: 50 ,icon: ImageIcon( AssetImage(icon), color: Color(0xFFFFFFFF)));
  }
}
