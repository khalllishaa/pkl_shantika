import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/app_styles.dart';
import '../../components/custom_card.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.light,
      appBar: _header(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingL, vertical: AppStyles.paddingM),
          child: Column(
            children: [
              SizedBox(height: AppStyles.paddingXL),
              FAQItem(
                question: "Bagaimana cara pemesanan tiket armada New Shantika melalui aplikasi?",
                answer: "Caranya mudah, Anda bisa melakukan pemesanan tiket dimana saja dan kapan saja. Cukup klik menu pesan tiket, lengkapi data, lakukan pembayaran. Setelah itu, Anda dapat melakukan perjalanan yang aman dan nyaman",
              ),
              SizedBox(height: 12),
              FAQItem(
                question: "Bagaimana cara pemesanan tiket armada New Shantika melalui aplikasi?",
                answer: "Caranya mudah, Anda bisa melakukan pemesanan tiket dimana saja dan kapan saja. Cukup klik menu pesan tiket, lengkapi data, lakukan pembayaran. Setelah itu, Anda dapat melakukan perjalanan yang aman dan nyaman",
              ),
              SizedBox(height: 12),
              FAQItem(
                question: "Bagaimana cara pemesanan tiket armada New Shantika melalui aplikasi?",
                answer: "Caranya mudah, Anda bisa melakukan pemesanan tiket dimana saja dan kapan saja. Cukup klik menu pesan tiket, lengkapi data, lakukan pembayaran. Setelah itu, Anda dapat melakukan perjalanan yang aman dan nyaman",
              ),
              SizedBox(height: 12),
              FAQItem(
                question: "Bagaimana cara pemesanan tiket armada New Shantika melalui aplikasi?",
                answer: "Caranya mudah, Anda bisa melakukan pemesanan tiket dimana saja dan kapan saja. Cukup klik menu pesan tiket, lengkapi data, lakukan pembayaran. Setelah itu, Anda dapat melakukan perjalanan yang aman dan nyaman",
              ),
              SizedBox(height: 12),
              FAQItem(
                question: "Bagaimana cara pemesanan tiket armada New Shantika melalui aplikasi?",
                answer: "Caranya mudah, Anda bisa melakukan pemesanan tiket dimana saja dan kapan saja. Cukup klik menu pesan tiket, lengkapi data, lakukan pembayaran. Setelah itu, Anda dapat melakukan perjalanan yang aman dan nyaman",
              ),
              SizedBox(height: 12),
              FAQItem(
                question: "Bagaimana cara pemesanan tiket armada New Shantika melalui aplikasi?",
                answer: "Caranya mudah, Anda bisa melakukan pemesanan tiket dimana saja dan kapan saja. Cukup klik menu pesan tiket, lengkapi data, lakukan pembayaran. Setelah itu, Anda dapat melakukan perjalanan yang aman dan nyaman",
              ),
              SizedBox(height: 12),
              FAQItem(
                question: "Bagaimana cara pemesanan tiket armada New Shantika melalui aplikasi?",
                answer: "Caranya mudah, Anda bisa melakukan pemesanan tiket dimana saja dan kapan saja. Cukup klik menu pesan tiket, lengkapi data, lakukan pembayaran. Setelah itu, Anda dapat melakukan perjalanan yang aman dan nyaman",
              ),
              SizedBox(height: 24),
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
            "FAQ",
            style: AppStyles.heading,
          ),
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    final isExpanded = false.obs;

    return Obx(() => CustomCardContainer(
      backgroundColor: AppStyles.card.withOpacity(0.5),
      boxShadow: [],
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              isExpanded.value = !isExpanded.value;
            },
            borderRadius: BorderRadius.circular(AppStyles.radiussL),
            child: Padding(
              padding: EdgeInsets.all(AppStyles.paddingL),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: AppStyles.menufav2,
                    ),
                  ),
                  SizedBox(width: AppStyles.spaceM),
                  AnimatedRotation(
                    turns: isExpanded.value ? 0.5 : 0,
                    duration: Duration(milliseconds: 1000),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppStyles.dark,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: SizedBox.shrink(),
            secondChild: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                AppStyles.paddingL,
                0,
                AppStyles.paddingL,
                AppStyles.paddingL,
              ),
              child: Text(
                answer,
                style: AppStyles.menufav.copyWith(color: AppStyles.grey1, fontSize: 14),
              ),
            ),
            crossFadeState: isExpanded.value
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 300),
          ),
        ],
      ),
    ));
  }
}