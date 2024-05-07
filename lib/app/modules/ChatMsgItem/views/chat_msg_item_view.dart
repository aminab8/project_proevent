import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_msg_item_controller.dart';

class ChatMsgItemView extends GetView<ChatMsgItemController> {
  const ChatMsgItemView(this.isChatting, this.messageBody, {Key? key}) : super(key: key);
  final bool isChatting;
  final String messageBody;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment:isChatting? Alignment.centerRight:Alignment.centerLeft ,
      child: Container(
        width: MediaQuery.of(context).size.width*0.65,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: isChatting?BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft:Radius.circular(12),
            bottomRight: Radius.circular(12),
          ) :BorderRadius.only(
            topRight: Radius.circular(12),
            bottomLeft:Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          color: isChatting? Colors.blue[900]:Colors.white,

        ),
        margin: EdgeInsets.all(10),
        child: Text(messageBody,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: isChatting?Colors.white:Colors.blue[900],
          ),
          textAlign:TextAlign.start ,

        ),

      ),
    );
  }
}