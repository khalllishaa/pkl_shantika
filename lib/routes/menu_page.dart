import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/bottom_nav.dart';
import '../controllers/main_menu_controllers.dart';
import '../pages/chat_page.dart';
import '../pages/home_section/home_page.dart';
import '../pages/profile_page.dart';
import '../pages/pesanan_section/pesanan_page.dart';

class MainMenu extends StatelessWidget {

  final List<Widget> pages = [
    HomePage(),
    ChatPage(),
    PesananPage(),
    ProfilePage(),
  ];
   MainMenu({super.key}) {
    Get.put(MainMenuController());
  }
  @override
  Widget build(BuildContext context) {
    MainMenuController controller = Get.find();
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: pages,
          )),
      bottomNavigationBar: Bottomnav(),
    );
  }
}
