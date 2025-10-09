import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/main_menu_controllers.dart';
import 'app_styles.dart';

class Bottomnav extends StatelessWidget {
  const Bottomnav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainMenuController>();

    return Obx(() => Container(
      margin: EdgeInsets.all(AppStyles.spaceXS),
      decoration: BoxDecoration(
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
          currentIndex: controller.selectedIndex.value,
          onTap: controller.updateIndex,
          selectedLabelStyle:
          AppStyles.bottomnav.copyWith(fontWeight: FontWeight.w700),
          unselectedLabelStyle: AppStyles.bottomnavunselected,
          selectedItemColor: AppStyles.primary,
          unselectedItemColor: AppStyles.light,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: [
            _navItem(
              index: 0,
              controller: controller,
              label: 'Beranda',
              iconPath: 'images/icons/home_outline.svg',
              activeIconPath: 'images/icons/home_fill.svg',
            ),
            _navItem(
              index: 1,
              controller: controller,
              label: 'Chat',
              iconPath: 'images/icons/chat_outline.svg',
              activeIconPath: 'images/icons/chat_fill.svg',
            ),
            _navItem(
              index: 2,
              controller: controller,
              label: 'Pesanan',
              iconPath: 'images/icons/ticket_outline.svg',
              activeIconPath: 'images/icons/ticket_fill.svg',
            ),
            _navItem(
              index: 3,
              controller: controller,
              label: 'Profil',
              iconPath: 'images/icons/profile_outline.svg',
              activeIconPath: 'images/icons/profile_fill.svg',
            ),
          ],
        ),
      ),
    ));
  }

  BottomNavigationBarItem _navItem({
    required int index,
    required MainMenuController controller,
    required String label,
    required String iconPath,
    required String activeIconPath,
  }) {
    final isActive = controller.selectedIndex.value == index;

    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        isActive ? activeIconPath : iconPath,
        width: 22,
        height: 22,
        color: isActive ? AppStyles.primary : AppStyles.grey3,
      ),
      label: label,
    );
  }
}
