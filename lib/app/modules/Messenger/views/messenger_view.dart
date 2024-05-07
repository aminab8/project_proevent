import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../ChatScreen/views/chat_screen_view.dart';
import '../controllers/messenger_controller.dart';

class MessengerView extends GetView<MessengerController> {
  MessengerView({Key? key}) : super(key: key);
  List images = [
    "assets/images/Christine.jpg",
    "assets/images/Davis.jpg",
    "assets/images/Johnson.jpg",
    "assets/images/Parker Bee.jpg",
    "assets/images/Smith.jpg",
  ];
  List names = [
    "Christine",
    "Davis",
    "Johnson",
    "Jones Noa",
    "Parker Bee",
    "Smith",
  ];
  List msgTiming = [
    "Mon",
    "12:20",
    "Sun",
    "22:20",
    "5:23",
  ];
  List msgs = [
    "hi how are you?",
    "where are you?",
    "hello dear ,is all right?",
    "it's nice to meet you",
    "Everything it's ok in asm?"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Messages",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        letterSpacing: 1,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.search,
                        size: 40,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Recent",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black45,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(images[index]),
                              minRadius: 33,
                            ),
                            SizedBox(width: 5),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  names[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black45,
                                    fontSize: 17,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Divider(thickness: 1),

              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    color: Colors.grey.shade200,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: List.generate(images.length, (index) {
                        return ListTile(
                          onTap: () {
                            Get.to(ChatScreenView());
                          },
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(55),
                            child: Image.asset(
                              images[index],
                              height: 55,
                              width: 55,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            names[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black45,
                              fontSize: 17,
                              letterSpacing: 1,
                            ),
                          ),
                          subtitle: Text(msgs[index]),
                          trailing: Text(msgTiming[index]),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}