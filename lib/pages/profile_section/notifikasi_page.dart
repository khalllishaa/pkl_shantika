import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkl_sahntikha/controllers/profile_controller.dart';

import '../../components/app_styles.dart';

class NotifikasiPage extends StatelessWidget {
  NotifikasiPage({super.key});
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.light,
      appBar: _header(),
      body: Stack(
        children: [
          _content()
        ],
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
              color: AppStyles.dark.withOpacity(0.08),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppStyles.dark),
            onPressed: () => Get.back(),
          ),
          title: Text(
            "Notifikasi",
            style: AppStyles.heading,
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return Padding(
      padding: EdgeInsets.all(AppStyles.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppStyles.iconS),
          _notificationSection(
            title: "Aktivitas",
            description:
            "Pastikan akunmu aman dengan memantau aktivitas login, register hingga notifikasi OTP.",
            value: controller.isAktivitasEnabled,
          ),
          SizedBox(height: AppStyles.iconS),
          _notificationSection(
            title: "Spesial Untukmu",
            description:
            "Kesempatan mendapat diskon terbatas, penawaran, tips, dan info fitur terbaru.",
            value: controller.isSpesialEnabled,
          ),
          SizedBox(height: AppStyles.iconS),
          _notificationSection(
            title: "Pengingat",
            description:
            "Dapatkan berita dan info perjalanan penting, pengingat pembayaran, booking, dan lainnya.",
            value: controller.isPengingatEnabled,
          ),
        ],
      ),
    );
  }

  Widget _notificationSection({
    required String title,
    required String description,
    required RxBool value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.menufav2.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: AppStyles.spaceprofile),
        Text(
          description,
          style: AppStyles.menufav.copyWith(color: AppStyles.grey3, fontSize: 14)),
        // SizedBox(height: AppStyles.spaceXXS),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Push notification",
              style: AppStyles.menufav2.copyWith(fontWeight: FontWeight.w500),
            ),
            Obx(
                  () => Transform.scale(
                scale: 0.7,
                child: Switch(
                  value: value.value,
                  onChanged: (val) => value.value = val,
                  activeColor: AppStyles.light,
                  activeTrackColor: AppStyles.primary,
                  inactiveThumbColor: AppStyles.light,
                  inactiveTrackColor: AppStyles.grey2,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

}
