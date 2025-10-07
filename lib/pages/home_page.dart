import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconly/iconly.dart';
import 'package:pkl_sahntikha/components/reuse_button.dart';
import 'package:pkl_sahntikha/components/app_styles.dart';

import '../components/title_home.dart';
import '../controllers/home_controllers.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.light,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _headerWithSearch(),
              SizedBox(height: AppStyles.spaceL),
              _imageSlider(),
              SectionTitle(title: "Menu Favorit"),
              _menuFavorit(),
              _promoCard(),
              Row(
                children: [
                  SectionTitle(title: "Riwayat"),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: AppStyles.paddingL),
                    child: Text(
                      "Lihat Semua",
                      style: AppStyles.seeAll,
                    ),
                  ),
                ],
              ),
              _riwayat(),
              Row(
                children: [
                  SectionTitle(title: "Promo"),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: AppStyles.paddingL),
                    child: Text(
                      "Lihat Semua",
                      style: AppStyles.seeAll,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: AppStyles.paddingL, right: AppStyles.paddingL, top: AppStyles.paddingM),
                child:
                  Image.asset(
                    "images/promo.png",
                ),
              ),
              // Row(
              //   children: [
              //     SectionTitle(title: "Artikel"),
              //     Spacer(),
              //     Padding(
              //       padding: EdgeInsets.only(right: AppStyles.paddingL),
              //       child: Text(
              //         "Lihat Semua",
              //         style: AppStyles.seeAll,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // HEADER + SEARCH gabung
  Widget _headerWithSearch() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: AppStyles.paddingFont),
                  child: Image.asset(
                    "images/logo_shantika.png",
                    height: 75,
                  ),
                ),
              ),
              Positioned(
                top: 55,
                right: 16,
                child: Icon(Icons.notifications,
                    color: AppStyles.light, size: 28),
              ),
            ],
          ),
        ),

        // Tambahkan form pencarian di luar Container header
        Positioned(
          bottom: -180,
          left: 16,
          right: 16,
          child: _searchTicket(),
        ),
      ],
    );
  }

  // Cari Tiket
  Widget _searchTicket() {
    return Container(
      margin: EdgeInsets.only(top: AppStyles.paddingL),
      padding: EdgeInsets.all(AppStyles.paddingL),
      decoration: BoxDecoration(
        color: AppStyles.light,
        borderRadius: BorderRadius.circular(AppStyles.radiusL),
        boxShadow: [
          BoxShadow(
            color: AppStyles.dark.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Cari Tiket Bus", style: AppStyles.tiket2),
          SizedBox(height: AppStyles.spaceM),
          _locationPicker("Keberangkatan", controller.departure),
          SizedBox(height: AppStyles.spaceM),
          _locationPicker("Tujuan", controller.arrival),
          SizedBox(height: AppStyles.spaceM),
          ReuseButton(
            text: "Cari Tiket",
            onPressed: controller.searchTicket,
          ),
        ],
      ),
    );
  }

  Widget _locationPicker(String label, RxString obs) {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.tiket1),
        SizedBox(height: AppStyles.spaceXS),
        InkWell(
          onTap: () {
            obs.value = label == "Keberangkatan" ? "Semarang" : "Jakarta";
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  obs.value.isEmpty ? "Pilih $label" : obs.value,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                Spacer(),
                Icon(Icons.swap_vert, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  // IMAGE SLIDER
  Widget _imageSlider() {
    final sliderImages = [
      "images/green_bus.png",
      "images/red_bus.png",
      "images/yellow_bus.png",
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppStyles.paddingS),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 190,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
        ),
        items: sliderImages.map((img) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(AppStyles.radiusL),
            child: Image.asset(img, fit: BoxFit.cover, width: double.infinity),
          );
        }).toList(),
      ),
    );
  }

  Widget _menuFavorit() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppStyles.paddingL,
        vertical: AppStyles.paddingS,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth;

          int crossAxisCount = (maxWidth / 87).floor().clamp(2, 4);

          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.menus.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (_, i) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppStyles.gradientMenu,
                        ),
                        child: Center(
                          child: Icon(
                            controller.menus[i]["icon"] as IconData,
                            color: AppStyles.light,
                          ),
                        ),
                      ),
                      SizedBox(height: AppStyles.spaceXS),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 32,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          controller.menus[i]["title"] as String,
                          style: AppStyles.menufav,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  // PROMO CARD
  Widget _promoCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppStyles.paddingL),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppStyles.gradientPromo,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Bagian teks
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bagaimana Perjalananmu?",
                  style: AppStyles.promoTitle,
                ),
                SizedBox(height: AppStyles.spaceXS),
                Text(
                  "Berikan review untuk pengalaman perjalananmu bersama New Shantika",
                  style: AppStyles.promoDesc,
                ),
                SizedBox(height: AppStyles.spaceS),
                ReuseButton(
                  text: "Beri Review",
                  isFullWidth: false,
                  onPressed: () {},
                  backgroundColor: AppStyles.light,
                  textColor: AppStyles.primary,
                  borderColor: AppStyles.primary,
                )
              ],
            ),
          ),

          SizedBox(width: AppStyles.spaceM),

          Image.asset(
            "images/stars.png",
            width: 70,
            height: 70,
          ),
        ],
      ),
    );
  }

  // Riwayat
  Widget _riwayat() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Column(
            children: controller.history.map((item) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: AppStyles.paddingS),
                padding: EdgeInsets.only(left: AppStyles.paddingL, right: AppStyles.paddingL, top: AppStyles.paddingM),
                decoration: BoxDecoration(
                  color: AppStyles.light,
                  borderRadius: BorderRadius.circular(AppStyles.radiusL),
                  boxShadow: [
                    BoxShadow(
                      color: AppStyles.dark.withOpacity(0.05),
                      blurRadius: AppStyles.radiusS,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            item["title"] ?? "",
                            style: AppStyles.tiket2.copyWith(fontWeight: FontWeight.w500)
                          ),
                        ),
                        ReuseButton(
                          text: "Beri Review",
                          fontSize: 12,
                          radius: 20,
                          isFullWidth: false,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Text(
                      item["date"] ?? "",
                      style: AppStyles.riwayat,
                    ),
                    SizedBox(height: AppStyles.spaceM),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(IconlyBold.location, color: AppStyles.grey1),
                        SizedBox(width: AppStyles.spaceS),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${item["from"]}",
                              style: AppStyles.riwayat2,
                            ),
                            Text("05:30", style: AppStyles.riwayat),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(IconlyBold.location, color: AppStyles.secondary),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${item["to"]}",
                              style: AppStyles.riwayat2,
                            ),
                            Text("09:30", style: AppStyles.riwayat),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: AppStyles.spaceM),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${item["price"]}",
                        style: AppStyles.seeAll.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          )),
        ],
      ),
    );
  }

}
