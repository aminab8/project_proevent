import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/send_feedback_controller.dart';

class SendFeedbackView extends GetView<SendFeedbackController> {
   SendFeedbackView({Key? key}) : super(key: key);
  final  SendFeedbackController controller = Get.put(SendFeedbackController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send our feedback !'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameTextEditingController,
              decoration: InputDecoration(
                hintText: "Enter the name of event",
                labelText: "NameEvent",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                isDense: true,
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: controller.feedbackTextEditingController,
              decoration: InputDecoration(
                hintText: "send our feedback",
                labelText: "Feedback",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                isDense: true,
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              controller.addFeedback(
                  controller.nameTextEditingController.text,
                controller.feedbackTextEditingController.text,);
              
            }, child: const Text("Send"),
            ),
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount : controller. itemCount.value,
                    itemBuilder: ((context , index){
              return ListTile(
                title: Text(controller.feedbacks.value[index].name!),
                subtitle:  Text(controller.feedbacks.value[index].feedback!),
                trailing: GestureDetector(child: Icon(CupertinoIcons.delete,color: Colors.red,),),
                onTap: (){
                  controller.removeFeedback(index);
                },
              );
            })))),
          ],
        ),
      ),
    );
  }
}
