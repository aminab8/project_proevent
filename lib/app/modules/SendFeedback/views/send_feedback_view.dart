import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../BottomNavigationBar/views/bottom_navigation_bar_view.dart';
import '../controllers/send_feedback_controller.dart';

class SendFeedbackView extends GetView<SendFeedbackController> {
   SendFeedbackView({Key? key}) : super(key: key);
  final  SendFeedbackController controller = Get.put(SendFeedbackController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send our feedback !',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Get.to((BottomNavigationBarView()));
        }, icon: Icon(CupertinoIcons.back),),
      ),
      body:
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Lottie.asset(
                'assets/animation/feedback.json',
                height: 500,
                reverse: true,
                repeat: true,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: controller.idTextEditingController,
              decoration: InputDecoration(
                hintText: "Enter  ID of the event",
                labelText: "ID Event",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                isDense: true,
              ),
            ),
            const SizedBox(height: 15,),
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
            const SizedBox(height: 15,),
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
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {

                int? eventId = int.tryParse(controller.idTextEditingController.text);

                if (eventId != null) {

                  controller.addFeedback(
                    eventId,
                    controller.nameTextEditingController.text,
                    controller.feedbackTextEditingController.text,
                  );
                } else {

                  Get.snackbar('Erreur', 'L\'ID doit être un nombre entier'); //
                }
              },
              child: const Text("Send"),
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
