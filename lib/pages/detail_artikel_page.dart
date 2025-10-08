import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pkl_sahntikha/components/app_styles.dart';
import 'package:pkl_sahntikha/controllers/artikel_controller.dart';

import '../components/custom_card.dart';

class DetailArtikelPage extends StatelessWidget {
  final String title;
  final String image;

  DetailArtikelPage({
    super.key,
    required this.title,
    required this.image,
  });

  final controller = ArtikelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.light,
      appBar: _header(),
      body: ListView(
        padding: EdgeInsets.all(AppStyles.paddingL),
        children: [
          _protokol(image, title),
          SizedBox(height: AppStyles.spaceL),
          _artikelList(),
          SizedBox(height: AppStyles.spaceL),
          _bacaLainnya(),
        ],
      ),
    );
  }

  PreferredSizeWidget _header() {
    return AppBar(
      leadingWidth: AppStyles.spaceXL,
      backgroundColor: AppStyles.light,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new),
        color: AppStyles.dark,
        onPressed: () => Get.back(),
      ),
      title: Text("Detail Artikel", style: AppStyles.heading),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: AppStyles.paddingL),
          child: Icon(BoxIcons.bx_share_alt, color: AppStyles.dark),
        )
      ],
    );
  }

  Widget _protokol(String image, String title) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppStyles.radiusM),
          child: Image.asset(
            image,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: AppStyles.spaceL),
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.search,
          ),
        ),
        SizedBox(height: AppStyles.spaceS),
        Text(
          "Perjalanan selama pandemi menghadirkan tantangan tersendiri, tetapi juga memberikan pengalaman berharga yang sulit dilupakan. "
              "Salah satu momen terbaik adalah ketika saya melakukan perjalanan ke daerah terpencil dengan protokol kesehatan yang ketat.",
          textAlign: TextAlign.center,
          style: AppStyles.bottomnav2,
        ),
      ],
    );
  }

  Widget _artikelList() {
    return ListView.builder(
      itemCount: controller.artikelList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = controller.artikelList[index];
        return Padding(
          padding: EdgeInsets.only(bottom: AppStyles.spaceL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title, style: AppStyles.tiket1),
              SizedBox(height: AppStyles.spaceS),
              ClipRRect(
                borderRadius: BorderRadius.circular(AppStyles.radiusM),
                child: Image.asset(
                  item.image,
                  height: 116.74,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: AppStyles.spaceS),
              Text(item.description, style: AppStyles.bottomnav2),
            ],
          ),
        );
      },
    );
  }

  Widget _bacaLainnya() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Baca Artikel Lainnya',
              style: AppStyles.tiket1.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              'Selengkapnya →',
              style: AppStyles.tiket1.copyWith(color: AppStyles.selengkapnya),
            ),
          ],
        ),
        SizedBox(height: AppStyles.spaceM),
        _buildCard('images/artikel2.png',
            'Penerapan Protokol Kesehatan Dalam perjalanan'),
        SizedBox(height: AppStyles.spaceL),
        _buildCard('images/artikel3.png',
            'Pengalaman terbaik dalam perjalanan selama pandemi'),
        SizedBox(height: AppStyles.spaceL),
        _buildCard('images/artikel4.png', 'Tips perjalanan aman di era new normal'),
      ],
    );
  }

  Widget _buildCard(String image, String title) {
    return CustomCardContainer(
      padding: EdgeInsets.zero,
      borderRadius: AppStyles.radiusM,
      borderColor: Colors.grey.shade300,
      borderWidth: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppStyles.radiusM),
            ),
            child: Image.asset(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppStyles.paddingM),
            child: Text(title, style: AppStyles.tiket1),
          ),
        ],
      ),
    );
  }

}
