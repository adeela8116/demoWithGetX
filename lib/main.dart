import 'package:demoproject_with_get_x/bottomNavBar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
      GetMaterialApp(
          home: MyApp(),
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
class listController extends GetxController{
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

  @override
  Widget build(context) {
    final Controller c = Get.put(Controller());
    final listController l = Get.put(listController());
    ScrollController _scrollController = ScrollController();
    String ItemData = '';

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            actions: [
                IconButton(
                  icon: ImageIcon( AssetImage("assets/images/edit.png"), color: Color(0xFFFFFFFF)),
                  onPressed: (){},
                  iconSize: 50,
                ),
              Spacer(flex: 2),
                Center(
                  child: c.count > 0 ? Obx(() => Text("${c.count} new messages", style: TextStyle( fontSize: 14),)) : Text(""),
                ),
              Spacer(flex: 2),
                IconButton(
                  icon: ImageIcon( AssetImage("assets/images/search.png"), color: Color(0xFFFFFFFF)),
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
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ListTile(
                                    onTap: () {
                                      ItemData = l._listViewData[index][0];
                                      print("ItemDATA: $ItemData");
                                    },
                                    trailing: Text(DateFormat('kk:mm').format(DateTime.now()),
                                      style: TextStyle(height: 1, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, color: Colors.white),),
                                    leading: CircleAvatar(backgroundImage: AssetImage('assets/images/ellipse.png'),),
                                    title: Text(l._listViewData[index][1],
                                      style: TextStyle(height: 1, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                    subtitle: Text("${l._listViewData[index][2]}",
                                      style: TextStyle(height: 1, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, color: Colors.white),)
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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}