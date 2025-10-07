import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/main_menu_controllers.dart';
import 'app_styles.dart';

class Bottomnav extends StatelessWidget {
  const Bottomnav({super.key});

  @override
  Widget build(BuildContext context) {
    MainMenuController controller = Get.find();

    return Obx(() => Container(
      margin: EdgeInsets.all(AppStyles.spaceXS),
      decoration: BoxDecoration(
        color: AppStyles.light,
        // borderRadius: BorderRadius.circular(AppStyles.radiusS),
        boxShadow: [
          BoxShadow(
            color: AppStyles.dark.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppStyles.light,
          elevation: 0,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.updateIndex,
          selectedLabelStyle: AppStyles.bottomnav.copyWith(fontWeight: FontWeight.bold),
          unselectedLabelStyle: AppStyles.bottomnav.copyWith(fontWeight: FontWeight.w500),
          items: [
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.home),
              activeIcon: Icon(IconlyBold.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.chat),
              activeIcon: Icon(IconlyBold.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.ticket),
              activeIcon: Icon(IconlyBold.ticket),
              label: 'Ticket',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile),
              activeIcon: Icon(IconlyBold.profile),
              label: 'Profil',
            ),
          ],
          selectedItemColor: AppStyles.primary,
          unselectedItemColor: AppStyles.primary,
          selectedFontSize: 14,
          unselectedFontSize: 12,
        ),
      ),
    ));
  }
}
