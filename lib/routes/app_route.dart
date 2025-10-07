import 'package:get/get.dart';
import 'package:pkl_sahntikha/pages/chat_page.dart';
import 'package:pkl_sahntikha/pages/home_page.dart';
import 'package:pkl_sahntikha/pages/profile_page.dart';
import 'package:pkl_sahntikha/pages/ticket_page.dart';
import 'package:pkl_sahntikha/routes/menu_page.dart';

import '../bindings/menu_binding.dart';

class Routes {
   static const main = '/main';
  static const home = '/home';
  static const chat = '/chat';
  static const ticket = '/ticket';
  static const profile = '/profile';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.main, page: () => MainMenu(), binding: MainMenuBinding()),
    GetPage(name: Routes.chat, page: () => ChatPage()),
    GetPage(name: Routes.ticket, page: () => TicketPage()),
    GetPage(name: Routes.profile, page: () => ProfilePage()),
  ];
}
