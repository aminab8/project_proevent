import 'package:get/get.dart';

import '../controllers/chat_msg_item_controller.dart';

class ChatMsgItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatMsgItemController>(
      () => ChatMsgItemController(),
    );
  }
}
