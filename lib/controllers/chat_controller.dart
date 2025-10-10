import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/contact_models.dart';

class ChatController extends GetxController {
  var contacts = <ContactItem>[].obs;

  @override
  void onInit() {
    contacts.addAll([
      ContactItem(
        title: "Chat CS Pusat New Shantika",
        type: "call",
        iconPath: "images/icons/call.svg",
        link: "tel:+6281234567890",
      ),
      ContactItem(
        title: "Whatsapp Agen Semarang",
        type: "whatsapp",
        iconPath: "images/icons/whatsapp.svg",
        link: "https://wa.me/6281234567890",
      ),
      ContactItem(
        title: "Whatsapp Agen Jepara",
        type: "whatsapp",
        iconPath: "images/icons/whatsapp.svg",
        link: "https://wa.me/628987654321",
      ),
      ContactItem(
        title: "Whatsapp Agen Kudus",
        type: "whatsapp",
        iconPath: "images/icons/whatsapp.svg",
        link: "https://wa.me/628192837465",
      ),
      ContactItem(
        title: "Facebook Agen Semarang",
        type: "facebook",
        iconPath: "images/icons/facebook.svg",
        link: "https://facebook.com/agensmg",
      ),
      ContactItem(
        title: "Facebook Agen Jepara",
        type: "facebook",
        iconPath: "images/icons/facebook.svg",
        link: "https://facebook.com/agenjpr",
      ),
      ContactItem(
        title: "Facebook Agen Kudus",
        type: "facebook",
        iconPath: "images/icons/facebook.svg",
        link: "https://facebook.com/agenkds",
      ),
    ]);
    super.onInit();
  }

  Future<void> openLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      Get.snackbar('Error', 'Gagal membuka link');
    }
  }

  // Color getIconColor(String type) {
  //   switch (type) {
  //     case "whatsapp":
  //       return Colors.green;
  //     case "facebook":
  //       return const Color(0xFF1877F2);
  //     case "call":
  //       return const Color(0xFF2C2C9E);
  //     default:
  //       return Colors.grey;
  //   }
  // }
}
