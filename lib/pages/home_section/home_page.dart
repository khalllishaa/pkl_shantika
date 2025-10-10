import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconly/iconly.dart';
import 'package:pkl_sahntikha/components/reuse_button.dart';
import 'package:pkl_sahntikha/components/app_styles.dart';
import '../../components/custom_card.dart';
import '../../components/title_home.dart';
import '../../controllers/home_controllers.dart';
import 'artikel_page.dart';
import 'notifications_page.dart';

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
              SizedBox(height: AppStyles.spaceeXL),
              _imageSlider(),
              SizedBox(height: AppStyles.spaceM),
              _menuFavorit(),
              SizedBox(height: AppStyles.spaceS),
              _promoCard(),
              SizedBox(height: AppStyles.spaceS),
              _riwayats(),
              _promoSection(),
              _artikelSection(),
              // _testimoni(),
              _buildTestimoniView(context),
              SizedBox(height: AppStyles.spaceS),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerWithSearch() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
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
                  padding: EdgeInsets.only(top: AppStyles.paddingXXL),
                  child: Image.asset(
                    "images/logo_shantika.png",
                    height: 75,
                  ),
                ),
              ),
              Positioned(
                top: 55,
                right: 16,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => NoticationsPage());
                  },
                  child: Icon(
                    Icons.notifications,
                    color: AppStyles.light,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: -165,
          left: 16,
          right: 16,
          child: _searchTicket(),
        ),
      ],
    );
  }

  Widget _searchTicket() {
    return CustomCardContainer(
      borderRadius: AppStyles.radiusXL,
      padding: EdgeInsets.all(AppStyles.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Center(
            child: Text(
              "Cari Tiket Bus",
              style: AppStyles.tiket2.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: AppStyles.spaceM),
          Stack(
            children: [
              Column(
                children: [
                  _locationPicker("Keberangkatan", controller.departure),
                  Container(
                    height: 1,
                    color: AppStyles.grey3,
                    margin: EdgeInsets.symmetric(
                      vertical: AppStyles.paddingM,
                      horizontal: AppStyles.paddingXXL,
                    ),
                  ),

                  _locationPicker("Tujuan", controller.arrival),
                ],
              ),
              Positioned(
                right: 0,
                top: 20,
                bottom: 20,
                child: Center(
                  child: Icon(
                    IconlyLight.swap,
                    color: AppStyles.dark,
                    size: AppStyles.iconM,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppStyles.spaceS),
          // Button Cari Tiket
          ReuseButton(
            text: "Cari Tiket",
            onPressed: controller.searchTicket,
            isFullWidth: true,
            backgroundColor: AppStyles.primary,
          ),
        ],
      ),
    );
  }

  Widget _locationPicker(String label, RxString obs) {
    return Obx(() => Row(
      children: [
        Icon(Icons.location_on_outlined,
            color: AppStyles.dark, size: AppStyles.iconL),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppStyles.tiket1.copyWith(
                  color: AppStyles.grey1,
                  fontSize: 13
                ),
              ),
              SizedBox(height: 2),
              Text(
                obs.value.isEmpty ? "Pilih $label" : obs.value,
                style: AppStyles.tiket2.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _imageSlider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppStyles.paddingS),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 190,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
        ),
        items: controller.sliderImages.map((img) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Menu Favorit"),
          SizedBox(height: AppStyles.spaceM),

          LayoutBuilder(
            builder: (context, constraints) {
              double maxWidth = constraints.maxWidth;
              int crossAxisCount = (maxWidth / 87).floor().clamp(2, 4);
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.menus.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (_, i) {
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
                        constraints: BoxConstraints(maxHeight: 32),
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
          ),
        ],
      ),
    );
  }

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
                SizedBox(height: AppStyles.spaceM),
                ReuseButton(
                  text: "Beri Review",
                  isFullWidth: false,
                  onPressed: () {},
                  backgroundColor: AppStyles.light,
                  textColor: AppStyles.primary,
                  borderColor: AppStyles.primary,
                  fontSize: 12,
                  width: 109,
                  // height: 28,
                )
              ],
            ),
          ),
          SizedBox(width: AppStyles.spaceM),
          Image.asset(
            "images/stars.png",
            width: 80,
            height: 80,
          ),
        ],
      ),
    );
  }

  Widget _riwayats() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SectionTitle(title: "Riwayat"),
              Spacer(),
              Text(
                "Lihat Semua",
                style: AppStyles.seeAll,
              ),
            ],
          ),
          Obx(() => Column(
            children: controller.history.map((item) {
              return CustomCardContainer(
                margin: EdgeInsets.symmetric(vertical: AppStyles.spaceS),
                padding: EdgeInsets.all(AppStyles.paddingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title + Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            item["title"] ?? "",
                            style: AppStyles.riwayat2.copyWith(
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        ReuseButton(
                          text: "Beri Review",
                          fontSize: 12,
                          radius: 20,
                          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
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
                                style: AppStyles.riwayat2),
                            Text("05:30", style: AppStyles.riwayat),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: AppStyles.spaceS),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(IconlyBold.location,
                            color: AppStyles.secondary),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${item["to"]}",
                                style: AppStyles.riwayat2),
                            Text("09:30", style: AppStyles.riwayat),
                          ],
                        ),
                      ],
                    ),
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
              );
            }).toList(),
          )),
        ],
      ),
    );
  }

  Widget _promoSection() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppStyles.paddingL,
        vertical: AppStyles.spaceS,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SectionTitle(title: "Promo"),
              Spacer(),
              Text(
                "Lihat Semua",
                style: AppStyles.seeAll,
              ),
            ],
          ),
          SizedBox(height: AppStyles.spaceXS),
          SizedBox(
            height: 245,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.promoList.length,
              separatorBuilder: (_, __) => SizedBox(width: 12),
              itemBuilder: (context, index) {
                final promo = controller.promoList[index];
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: _promoItem(
                    title: promo["title"]!,
                    subtitle: promo["subtitle"]!,
                    date: promo["date"]!,
                    imagePath: promo["imagePath"]!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _promoItem({
    required String title,
    required String subtitle,
    required String date,
    required String imagePath,
  }) {
    return CustomCardContainer(
      margin: EdgeInsets.symmetric(vertical: AppStyles.spaceS),
      padding: EdgeInsets.zero,
      borderRadius: AppStyles.radiusL,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppStyles.radiusL),
              topRight: Radius.circular(AppStyles.radiusL),
            ),
            child: Image.asset(
              imagePath,
              height: 130,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(AppStyles.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppStyles.spaceXS),
                Text(
                  title,
                  style: AppStyles.menufav2.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: AppStyles.spaceXS),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        subtitle,
                        style: AppStyles.riwayat.copyWith(
                          color: AppStyles.secondary,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: AppStyles.spaceS),
                    Icon(
                      IconlyLight.calendar,
                      size: AppStyles.iconL,
                      color: AppStyles.dark,
                    ),
                    SizedBox(width: 4),
                    Text(
                      date,
                      style: AppStyles.riwayat,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );}

  Widget _artikelSection() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppStyles.paddingL,
        vertical: AppStyles.spaceS,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            children: [
              SectionTitle(title: "Artikel"),
              Spacer(),
              GestureDetector(
                onTap: () => Get.to(() => ArtikelPage()),
                child: Text(
                  "Lihat Semua",
                  style: AppStyles.seeAll,
                ),
              ),
            ],
          ),
          SizedBox(height: AppStyles.spaceM),

          SizedBox(
            height: 200,
            child: Obx(() => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.articles.length,
              itemBuilder: (context, index) {
                final article = controller.articles[index];
                return _artikelCard(
                  imageUrl: article["image"] ?? "",
                  title: article["title"] ?? "",
                );
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget _artikelCard({required String imageUrl, required String title}) {
    return Container(
      width: 145,
      margin: EdgeInsets.only(right: AppStyles.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppStyles.radiusM),
            child: Image.asset(
              imageUrl,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: AppStyles.spaceS),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingXS),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.artikel
            ),
          ),
        ],
      ),
    );
  }

  Widget _testimoni() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppStyles.paddingM,
          ),
          child: Row(
            children: [
              SectionTitle(title: "Testimoni"),
              Spacer(),
              Text(
                "Lihat Semua",
                style: AppStyles.seeAll,
              ),
            ],
          ),
        ),

        Column(
          children: controller.testimonials.map((t) {
            final List<String> images =
                (t["images"] as List<dynamic>?)?.map((e) => e as String).toList() ?? [];

            return CustomCardContainer(
              margin: EdgeInsets.symmetric(
                vertical: AppStyles.paddingS,
                horizontal: AppStyles.paddingM,
              ),
              padding: EdgeInsets.all(AppStyles.paddingM),
              borderRadius: AppStyles.radiusM,
              backgroundColor: AppStyles.light,
              boxShadow: [
                BoxShadow(
                  color: AppStyles.dark.withOpacity(0.2),
                  blurRadius: AppStyles.radius,
                  offset: Offset(0, 2),
                ),
              ],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama + Tanggal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        t["name"] as String? ?? "",
                        style: AppStyles.menufav2.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        t["date"] as String? ?? "",
                        style: AppStyles.riwayat.copyWith(
                          fontSize: 13,
                          color: AppStyles.dark,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppStyles.spaceM),

                  // Kelas Bus
                  Text(
                    t["busClass"] as String? ?? "",
                    style: AppStyles.riwayat,
                  ),
                  SizedBox(height: AppStyles.spaceM),

                  // Rating
                  Row(
                    children: List.generate(
                      5,
                          (i) => Icon(
                        i < (t["rating"] as int? ?? 0)
                            ? IconlyBold.star
                            : IconlyLight.star,
                        color: AppStyles.stars,
                        size: AppStyles.iconM,
                      ),
                    ),
                  ),
                  SizedBox(height: AppStyles.spaceM),

                  // Review
                  Text(
                    t["review"] as String? ?? "",
                    style: AppStyles.riwayat.copyWith(
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: AppStyles.spaceM),

                  // Foto testimoni kecil
                  if (images.isNotEmpty)
                    Row(
                      children: [
                        ...images.take(3).map((img) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                img,
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                        if (images.length > 3)
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppStyles.grey2,
                              borderRadius: BorderRadius.circular(AppStyles.radiusM),
                            ),
                            child: Center(
                              child: Text(
                                "+${images.length - 3}",
                                style: AppStyles.riwayat.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTestimoniView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingL),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SectionTitle(title: "Testimoni"),
              Text(
                "Lihat Semua",
                style: AppStyles.seeAll,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.37,
            child: ListView.separated(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: AppStyles.spaceM,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return CustomCardContainer(
                  width: 320,
                  margin: EdgeInsets.only(bottom: AppStyles.spaceM),
                  borderColor: AppStyles.grey3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Esther Howard",
                            style: AppStyles.menufav2.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "13 Feb 2025",
                            style: AppStyles.riwayat.copyWith(
                              fontSize: 13,
                              color: AppStyles.dark,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppStyles.spaceS),
                      Text(
                        "Super Executive",
                        style: AppStyles.riwayat,
                      ),
                      SizedBox(height: AppStyles.spaceXS),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppStyles.stars,
                            size: AppStyles.iconM,
                          ),
                          Icon(
                            Icons.star,
                            color: AppStyles.stars,
                            size: AppStyles.iconM,
                          ),
                          Icon(
                            Icons.star,
                            color: AppStyles.stars,
                            size: AppStyles.iconM,
                          ),
                          Icon(
                            Icons.star,
                            color: AppStyles.stars,
                            size: AppStyles.iconM,
                          ),
                          Icon(
                            Icons.star,
                            color: AppStyles.stars,
                            size: AppStyles.iconM,
                          ),
                        ],
                      ),
                      SizedBox(height: AppStyles.spaceS),
                      Text(
                        "Sangat menyenangkan melakukan perjalanan bersama bus Shantika. Supirnya baik dan ramah, ACnya dingin, dan saya bisa tertidur pulas.",
                        style: AppStyles.riwayat.copyWith(
                          fontSize: 14,
                          height: 1.4,
                          color: AppStyles.dark
                        ),
                      ),
                      SizedBox(height: AppStyles.spaceS),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "images/testimoni.png",
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: AppStyles.spaceXS),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "images/testimoni.png",
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: AppStyles.spaceXS),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "images/testimoni.png",
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: AppStyles.spaceXS),
                          Align(
                            alignment: Alignment.center,
                            child: Text("+2", style: AppStyles.tiket1),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
