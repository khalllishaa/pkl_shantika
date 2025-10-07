import 'package:get/get.dart';
import 'package:pkl_sahntikha/controllers/chat_contoller.dart';
import 'package:pkl_sahntikha/controllers/ticket_controller.dart';

import '../controllers/main_menu_controllers.dart';
import '../controllers/profile_controller.dart';

class MainMenuBinding extends Bindings{
  @override
  void dependencies() {
    if (!Get.isRegistered<MainMenuController>()) {
      Get.lazyPut(() => MainMenuController());
    }

    if (!Get.isRegistered<ProfileController>()) {
      Get.lazyPut(() => ProfileController());
    }

    if (!Get.isRegistered<ChatController>()) {
      Get.lazyPut(() => ChatController());
    }

    if (!Get.isRegistered<TicketController>()) {
      Get.lazyPut(() => TicketController());
    }
  }
}