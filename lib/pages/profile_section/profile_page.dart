import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pkl_sahntikha/components/app_styles.dart';
import 'package:pkl_sahntikha/components/custom_card.dart';
import 'package:pkl_sahntikha/components/reuse_button.dart';
import 'package:pkl_sahntikha/controllers/profile_controller.dart';
import 'package:pkl_sahntikha/pages/profile_section/faq_page.dart';
import 'package:pkl_sahntikha/pages/profile_section/notifikasi_page.dart';
import 'package:pkl_sahntikha/pages/profile_section/snk_page.dart';
import 'package:pkl_sahntikha/pages/profile_section/tentang_kami_page.dart';

import '../home_section/notifications_page.dart';
import 'informasi_pribadi_page.dart';
import 'kebijakan_privasi_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.light,
      appBar: _header(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppStyles.spaceL),

              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/profile.png'),
                backgroundColor: AppStyles.grey2,
              ),
              SizedBox(height: AppStyles.spaceM),

              // Name
              Text(
                "Anastasya Carolina",
                style: AppStyles.heading.copyWith(fontSize: 18),
              ),
              SizedBox(height: AppStyles.spaceXS),

              // Phone Number
              Text(
                "087374543899",
                style: AppStyles.riwayat.copyWith(fontSize: 14),
              ),
              SizedBox(height: AppStyles.spaceL),

              // Menu Items
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingL),
                child: Column(
                  children: [
                    _menuItem(
                      svgIcon: 'images/icons/profile.svg',
                      text: "Informasi Pribadi",
                      onTap: () {
                        Get.to(() => InformasiPribadiPage());
                      },
                    ),
                    SizedBox(height: AppStyles.spaceS),

                    _menuItem(
                      svgIcon: 'images/icons/notif.svg',
                      text: "Notifikasi",
                      onTap: () {
                        Get.to(() => NotifikasiPage());
                      },
                    ),
                    SizedBox(height: AppStyles.spaceS),

                    _menuItem(
                      svgIcon: 'images/icons/info.svg',
                      text: "Tentang Kami",
                      onTap: () {
                        Get.to(() => TentangKamiPage());
                      },
                    ),
                    SizedBox(height: AppStyles.spaceS),

                    _menuItem(
                      svgIcon: 'images/icons/check.svg',
                      text: "Kebijakan Privasi",
                      onTap: () {
                        Get.to(() => KebijakanPrivasiPage());
                      },
                    ),
                    SizedBox(height: AppStyles.spaceS),

                    _menuItem(
                      svgIcon: 'images/icons/note.svg',
                      text: "Syarat dan Ketentuan",
                      onTap: () {
                        Get.to(() => SnkPage());
                      },
                    ),
                    SizedBox(height: AppStyles.spaceS),

                    _menuItem(
                      svgIcon: 'images/icons/faq.svg',
                      text: "FAQ",
                      onTap: () {
                        Get.to(() => FAQPage());
                      },
                    ),
                    SizedBox(height: AppStyles.spaceS),

                    _menuItem(
                      svgIcon: 'images/icons/stars.svg',
                      text: "Beri Nilai App Kami",
                      trailing: Text(
                        "Versi 1.20.5",
                        style: AppStyles.riwayat.copyWith(fontSize: 12),
                      ),
                      onTap: () {
                        // Launch app store or play store
                      },
                    ),
                    SizedBox(height: AppStyles.spaceL),

                    // Logout Button
                    ReuseButton(
                      text: "Keluar Akun",
                      onPressed: () {
                        controller.logout();
                        // Logout logic here
                      },
                      backgroundColor: AppStyles.logout,
                      radius: AppStyles.radiusL,
                    ),
                    SizedBox(height: AppStyles.spaceL),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _header() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 4),
      child: Container(
        decoration: BoxDecoration(
          color: AppStyles.light,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Profil",
            style: AppStyles.heading,
          ),
          centerTitle: true,
        ),
      ),
    );
  }

  Widget _menuItem({
    required String svgIcon,
    required String text,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return CustomCardContainer(
      backgroundColor: AppStyles.background,
      height: 56,
      boxShadow: [],
      padding: EdgeInsets.symmetric(
        horizontal: AppStyles.paddingM,
        vertical: AppStyles.paddingL,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppStyles.radiussL),
        child: Row(
          children: [
            SvgPicture.asset(
              svgIcon,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                AppStyles.dark,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: AppStyles.spaceM),
            Expanded(
              child: Text(
                text,
                style: AppStyles.menufav2,
              ),
            ),
            if (trailing != null) ...[
              trailing,
              SizedBox(width: AppStyles.spaceS),
            ],
            Icon(
              Icons.chevron_right,
              color: AppStyles.dark,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}