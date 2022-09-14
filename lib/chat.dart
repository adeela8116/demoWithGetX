import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class chatController extends GetxController {
  var data = Get.arguments;
  String userID = '', userNAME = '';
  List<ChatMessage> messages = [];

  @override
  void onInit() {
    userID = data[0];
    userNAME = data[1];
    messages.addAll([
      ChatMessage(messageContent: "Hello, Hassan", messageType: "receiver"),
      ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
      ChatMessage(messageContent: "Hey ${userNAME}, I am doing fine. what about you?", messageType: "sender"),
      ChatMessage(messageContent: "doing OK.", messageType: "receiver"),
      ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
    ].obs);
    super.onInit();
  }
  addMsg(String msg){
    messages.add(ChatMessage(messageContent: msg, messageType: "sender"));
  }
}

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  chatController c = Get.put(chatController());
  TextEditingController _messageController= TextEditingController();
  List<ChatMessage> messages = [];
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              // decoration: (BoxDecoration(color: Colors.amber)),
              height: Get.height/1.05,
              width: Get.width,
              padding: const EdgeInsets.fromLTRB(2,20,2,10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon( Icons.arrow_back_ios_new_sharp, size: 15, color: Color(0xFFFFFFFF)),
                        onPressed: (){ Get.back();},
                        iconSize: 50,
                      ),
                      Center(
                        child: Text("${c.userNAME}\nOnline now", textAlign: TextAlign.center, style: const TextStyle( fontSize: 14),),
                      ),
                      IconButton(
                        icon: const Icon( Icons.call, size: 25, color: Color(0xFF007EF4)),
                        onPressed: (){},
                        iconSize: 50,
                      ),
                    ],
                  ),
                  const Divider(height: 30, thickness: 2, color: Colors.black12),
                  Expanded(
                      flex: 8,
                      child:Container(
                        height: Get.height/1,
                        child:  Scrollbar(
                          child: GetBuilder<chatController>(
                            builder: (c) => ListView.builder(
                              controller: _scrollController,
                              itemCount: c.messages.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10,bottom: 10),
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index){
                                return Container(
                                  padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                                  child: Align(
                                    alignment: (c.messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        c.messages[index].messageType  == "receiver"? BorderRadius.only(
                                          topRight: Radius.circular(16),
                                          topLeft: Radius.circular(16),
                                          bottomRight: Radius.circular(16),
                                        ) :
                                        BorderRadius.only(
                                          topRight: Radius.circular(16),
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                        color: (c.messages[index].messageType  == "receiver"?Colors.grey.shade600:Colors.blueAccent),
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: Text(c.messages[index].messageContent, style: TextStyle(fontSize: 15),),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      )
                  ),
                  const Spacer(flex: 1),
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                            height: Get.height * 0.065,
                            width: Get.width * 0.95,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black54,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(30))),
                            child: TextFormField(
                              controller: _messageController,
                              onFieldSubmitted: (val) {
                                sendMessage();
                              },
                              decoration: InputDecoration(
                                prefixIcon: IconButton(
                                  color: Colors.black54,
                                  onPressed: () {},
                                  icon: const Icon(Icons.face, color: Colors.white),
                                ),
                                suffixIcon: Container(
                                  width: 80,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.blue,
                                        child: IconButton(
                                          onPressed: () {
                                            imageSend();
                                          },
                                          alignment: Alignment.center,
                                          color: Color(0xFF007EF4),
                                          icon: const Icon(Icons.camera_alt_outlined, size: 20, color: Colors.white),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.blue,
                                        child: IconButton(
                                          onPressed: () {
                                            // sendMessage();
                                          },
                                          alignment: Alignment.center,
                                          color: Color(0xFF007EF4),
                                          icon: const Icon(Icons.mic, size: 20, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                contentPadding: const EdgeInsets.only(left: 8, right: 4, top: 12, bottom: 12),
                                hintText: "Type your message",
                                border: InputBorder.none,
                              ),
                              cursorColor: Colors.white,
                            ),
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
  void sendMessage() async {
    String newMessage = _messageController.text;

    if (newMessage == "") {
      return;
    }
    _messageController.clear();
    c.addMsg(newMessage);

    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }
  void imageSend() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? selected =  await _picker.pickImage(source: ImageSource.camera);
    if(selected!=null){
      String imgPath = selected.path;
      String filename = '$imgPath-${DateTime.now()}.png';
    }
  }
}



class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

