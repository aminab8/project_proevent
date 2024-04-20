
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/model/feedback_model.dart';


class SendFeedbackController extends GetxController {
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
    nameTextEditingController.dispose();
    feedbackTextEditingController.dispose();
  }
  addFeedback(String name, String feedback) {
    feedBackModel = FeedbackModel(name:  name , feedback: feedback);
    feedbacks.value.add(feedBackModel);
    itemCount.value = feedbacks.length;
  }

  removeFeedback(int index) {
    feedbacks.value.removeAt(index);
    itemCount.value = feedbacks.value.length;
  }



// void increment() => count.value++;
}
