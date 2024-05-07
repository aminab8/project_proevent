
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/model/feedback_model.dart';


class SendFeedbackController extends GetxController {
  TextEditingController idTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController feedbackTextEditingController = TextEditingController();
  Rx<List<FeedbackModel>> feedback = Rx<List<FeedbackModel>>([]);
  var itemCount = 0.obs;
  late FeedbackModel feedBackModel;
  var feedbacks;
  @override
  void onInit() {
    super.onInit();
    feedbacks = <FeedbackModel>[].obs;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    idTextEditingController.dispose();
    nameTextEditingController.dispose();
    feedbackTextEditingController.dispose();
  }
  addFeedback( int id , String name, String feedback) {
    feedBackModel = FeedbackModel(id:id ,name:  name , feedback: feedback);
    feedbacks.value.add(feedBackModel);
    itemCount.value = feedbacks.length;
  }

  removeFeedback(int index) {
    feedbacks.value.removeAt(index);
    itemCount.value = feedbacks.value.length;
  }



// void increment() => count.value++;
}
