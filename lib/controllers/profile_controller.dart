  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkl_sahntikha/components/reuse_button.dart';

import '../components/app_styles.dart';

  class ProfileController extends GetxController{

    var isAktivitasEnabled = false.obs;
    var isSpesialEnabled = true.obs;
    var isPengingatEnabled = false.obs;

    Future<void> logout() async {
      Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyles.radiusXL),
          ),
          backgroundColor: AppStyles.light,
          child: Padding(
            padding: EdgeInsets.all(AppStyles.spaceL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppStyles.error,
                    boxShadow: [],
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Icon(
                    Icons.logout,
                    color: AppStyles.logout,
                    size: AppStyles.iconL,
                  ),
                ),
                SizedBox(height: AppStyles.spaceL),
                Text(
                  "Keluar Akun",
                  style: AppStyles.heading.copyWith(fontWeight: FontWeight.w800),
                ),
                SizedBox(height: AppStyles.spaceXXXS),
                Text(
                  "Yakin Anda akan keluar akun Anastasya Carolina",
                  textAlign: TextAlign.start,
                  style: AppStyles.menufav.copyWith(color: AppStyles.grey3, fontSize: 14),
                ),
                SizedBox(height: 21),
                Row(
                  children: [
                    Expanded(
                      child: ReuseButton(
                        height: 38,
                        text: "Batal",
                        onPressed: () {
                          Get.back();
                        },
                        backgroundColor: AppStyles.light,
                        textColor: AppStyles.dark,
                        borderColor: AppStyles.dark.withOpacity(0.3),
                      ),
                    ),
                    SizedBox(width: AppStyles.spaceM),
                    Expanded(
                      child: ReuseButton(
                        height: 38,
                        text: "Keluar",
                        onPressed: () {
                        },
                        backgroundColor: AppStyles.logout, // warna merah
                        textColor: AppStyles.light,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        barrierDismissible: false,
      );
    }
  }