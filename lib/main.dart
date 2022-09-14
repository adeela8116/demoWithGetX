import 'package:demoproject_with_get_x/bottomNavBar.dart';
import 'package:demoproject_with_get_x/chat.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
      GetMaterialApp(
          home: const MyApp(),
        theme: ThemeData(primarySwatch: Colors.blue),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
      )
  );
}
class Controller extends GetxController{
  var count = 1.obs;
  increment() => count++;
}
class ListController extends GetxController{
  final List<List<String>> _listViewData =[
    ["1", "Adeela", "This is the text msg", "my.website.com"],
    ["2", "Waqar", "Text to update", "my.website.com"],
    ["3", "Ahsan", "Text msg. Text to update", "my.website.com"],
    ["4", "Ali", "This is the text msg", "my.website.com"],
    ["5", "Azlan", "Text to update", "my.website.com"],
  ].obs;
  addToList(List<String> list){
    _listViewData.add(list);
  }

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final Controller c = Get.put(Controller());
    final ListController l = Get.put(ListController());
    ScrollController scrollController = ScrollController();


    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            actions: [
                IconButton(
                  icon: const ImageIcon( AssetImage("assets/images/edit.png"), color: Color(0xFFFFFFFF)),
                  onPressed: (){},
                  iconSize: 50,
                ),
              const Spacer(flex: 2),
                Center(
                  child: c.count > 0 ? Obx(() => Text("${c.count} new messages", style: const TextStyle( fontSize: 14),)) : const Text(""),
                ),
              const Spacer(flex: 2),
                IconButton(
                  icon: const ImageIcon( AssetImage("assets/images/search.png"), color: Color(0xFFFFFFFF)),
                  onPressed: (){},
                  iconSize: 50,
                ),
              ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.fromLTRB(Get.width/40, Get.height/20, Get.width/40, Get.height/20),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 400,
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: l._listViewData.length,
                          controller: scrollController,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ListTile(
                                    onTap: () {
                                      print("object: ${[l._listViewData[index][0],l._listViewData[index][1]]}");
                                      Get.to(() => ChatPage(), arguments: [l._listViewData[index][0],l._listViewData[index][1]]);
                                    },
                                    trailing: Text(DateFormat('kk:mm').format(DateTime.now()),
                                      style: const TextStyle(height: 1, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, color: Colors.white),),
                                    leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/ellipse.png'),),
                                    title: Text(l._listViewData[index][1],
                                      style: const TextStyle(height: 1, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                    subtitle: Text(l._listViewData[index][2],
                                      style: const TextStyle(height: 1, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, color: Colors.white),)
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}