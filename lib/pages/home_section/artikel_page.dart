import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pkl_sahntikha/controllers/artikel_controller.dart';
import '../../components/app_styles.dart';
import '../../components/custom_card.dart';
import 'detail_artikel_page.dart';

class ArtikelPage extends StatelessWidget {
  final controller = ArtikelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.light,
      appBar: _header(),
      body: Column(
        children: [
          _searchBar(controller),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.filteredArticles.length,
              padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingL),
              itemBuilder: (context, index) {
                final article = controller.filteredArticles[index];
                return _articleCard(article);
              },
            )),
          ),
        ],
      ),
    );
  }
}

PreferredSizeWidget _header() {
  return AppBar(
    leadingWidth: AppStyles.spaceXL,
    backgroundColor: AppStyles.light,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_rounded, size: AppStyles.iconXL, color: AppStyles.dark,),
      color: AppStyles.dark,
      onPressed: () => Get.back(),
    ),
    title: Text(
      "Artikel",
      style: AppStyles.heading,
    ),
  );
}

Widget _searchBar(ArtikelController controller) {
  return Padding(
    padding: EdgeInsets.all(AppStyles.paddingL),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingM),
      decoration: BoxDecoration(
        color: AppStyles.light,
        border: Border.all(color: AppStyles.grey2),
        borderRadius: BorderRadius.circular(AppStyles.radiusXL),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) => controller.searchQuery.value = value,
              decoration: InputDecoration(
                hintText: "Cari Artikel",
                hintStyle: AppStyles.search,
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.search_sharp, color: AppStyles.dark),
        ],
      ),
    ),
  );
}

Widget _articleCard(Map<String, String> article) {
  return Padding(
    padding: EdgeInsets.only(bottom: AppStyles.paddingL),
    child: InkWell(
      borderRadius: BorderRadius.circular(AppStyles.radiussL),
      onTap: () {
        Get.to(() => DetailArtikelPage(
          title: article["title"]!,
          image: article["image"]!,
        ));
      },
      child: CustomCardContainer(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppStyles.radiussL),
              ),
              child: Image.asset(
                article["image"]!,
                width: double.infinity,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppStyles.paddingM),
              child: Text(
                article["title"]!,
                style: AppStyles.tiket2.copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
