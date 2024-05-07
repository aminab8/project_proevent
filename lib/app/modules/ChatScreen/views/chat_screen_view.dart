import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../ChatMsgItem/views/chat_msg_item_view.dart';
import '../controllers/chat_screen_controller.dart';

class ChatScreenView extends GetView<ChatScreenController> {
  const ChatScreenView( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize:MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              height: 85,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){Get.back();}, icon: Icon(CupertinoIcons.back)),
                  SizedBox(width: 5,),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/images/Christine.jpg"
                    ),
                    maxRadius: 28,
                  ),
                  SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Christine",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19
                        ),),
                      SizedBox(height: 8,),
                      Text("Ative 5hours ago",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                            color: Colors.grey
                        ),),
                    ],
                  ),
                  Spacer(),
                  IconButton(onPressed:(){}, icon: Icon(Icons.more_vert))
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey.shade200,
                child: ListView(
                  padding: EdgeInsets.all(15),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Today",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ChatMsgItemView(true, "Hi ,Chrisine How Are you?"),
                    ChatMsgItemView(false, "Hi ,I'm fine"),
                    ChatMsgItemView(true, "Are you going to the Siminaire this week?"),
                    ChatMsgItemView(false, "Hi ,Yes"),
                    ChatMsgItemView(true, "ok see you there"),
                    ChatMsgItemView(true, "Good bye"),
                    ChatMsgItemView(false, "Tanks Bye"),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),

        ),
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type something....",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue[900],
                      )
                  ),
                  maxLines: 10,
                  minLines: 1,
                ),
              ),
              SizedBox(width: 20,),
              InkWell(
                onTap:(){} ,
                hoverColor: Colors.white,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(13),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    CupertinoIcons.arrow_right_circle_fill,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              )

            ],
          ),
        ),

      ),
    );
  }
}