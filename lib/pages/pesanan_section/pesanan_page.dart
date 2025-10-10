import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pkl_sahntikha/controllers/pesanan_controller.dart';
import 'package:pkl_sahntikha/pages/pesanan_section/detail_pesanan_page.dart';
import 'package:pkl_sahntikha/pages/pesanan_section/riwayat_page.dart';

import '../../components/app_styles.dart';
import '../../components/custom_card.dart';
import '../../components/reuse_button.dart';
import '../../controllers/home_controllers.dart';

class PesananPage extends StatelessWidget {
  final controller = Get.put(PesananController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.light,
      appBar: _header(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _riwayats(),
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
            "Pesanan",
            style: AppStyles.heading,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: AppStyles.paddingL),
              child: IconButton(
                icon: Icon(
                  Icons.history_outlined,
                  color: AppStyles.dark,
                  size: AppStyles.iconL,
                ),
                onPressed: () {
                  Get.to(() => RiwayatPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _riwayats() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppStyles.spaceM),
          Obx(() => Column(
            children: controller.pesanan.map((item) {
              final style = controller.getStatusStyle(item["status"]);
              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailPesananPage(pesananData: item));
                },
                child: CustomCardContainer(
                  margin: EdgeInsets.symmetric(vertical: AppStyles.spaceS),
                  padding: EdgeInsets.all(AppStyles.paddingM),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item["title"] ?? "",
                              style: AppStyles.menufav2.copyWith(
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          IntrinsicWidth(
                            child: ReuseButton(
                              text: style.text,
                              height: 32,
                              fontSize: 12,
                              radius: 20,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 16,
                              ),
                              isFullWidth: false,
                              backgroundColor: style.color,
                              textColor: AppStyles.light,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      Text(
                        item["date"] ?? "",
                        style: AppStyles.riwayat,
                      ),
                      SizedBox(height: AppStyles.spaceM),

                      // From
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(IconlyBold.location, color: AppStyles.grey1),
                          SizedBox(width: AppStyles.spaceS),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${item["from"]}",
                                  style: AppStyles.menufav2.copyWith(fontWeight: FontWeight.w700)),
                              Text("${item["depart_time"]}", style: AppStyles.riwayat),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: AppStyles.spaceS),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(IconlyBold.location, color: AppStyles.secondary),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${item["to"]}",
                                  style: AppStyles.menufav2.copyWith(fontWeight: FontWeight.w600)),
                              Text("${item["arrive_time"]}", style: AppStyles.riwayat),
                            ],
                          ),
                        ],
                      ),

                      // Harga
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Rp ${item["price"]}",
                          style: AppStyles.seeAll.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: AppStyles.spaceS),
                    ],
                  ),
                ),
              );
            }).toList(),
          )),
        ],
      ),
    );
  }
}
