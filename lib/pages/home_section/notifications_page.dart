import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../components/app_styles.dart';

class NoticationsPage extends StatelessWidget {
  NoticationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _header(),
        body: TabBarView(
          children: [
            NotificationList(),
            NotificationList(),
          ],
        ),
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
        "Notifikasi",
        style: AppStyles.heading,
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(AppStyles.spaceXXL),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: AppStyles.paddingL),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3)),
          ),
          child: TabBar(
            labelColor: AppStyles.secondary,
            unselectedLabelColor: AppStyles.grey3,
            indicatorColor: AppStyles.secondary,
            indicatorWeight: 2,
            labelStyle: AppStyles.menufav2.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: AppStyles.seeAll.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Tab(text: 'Semua 16'),
              Tab(text: 'Belum Dibaca 7'),
            ],
          ),
        ),
      ),
    );
  }

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateSection('8 Februari 2024'),
          _buildNotificationItem(
            icon: IconlyLight.ticket,
            title: 'Promo Tiket Murah Mudik 2025',
            subtitle: 'Yuk segera amankan tiket mudik mu sekarang juga sebelum kehabisan...',
            time: '10:00',
          ),
          _buildNotificationItem(
            icon: Icons.check_circle_outline,
            title: 'Tiket anda sudah dibayar lunas',
            subtitle: 'Terimakasih sudah membeli tiket di new shantika nikmati perjalanannya.',
            time: '10:00',
          ),
          _buildNotificationItem(
            icon: FontAwesome.money_bill_1,
            title: 'Segera Bayar Tiket yang sudah anda pesan',
            subtitle: 'Bayar tiket anda dan nikmati perjalanan bus new shantika',
            time: '10:00',
          ),
          _buildDateSection('8 Februari 2024'),
          _buildNotificationItem(
            icon: IconlyLight.ticket,
            title: 'Promo Tiket Murah Mudik 2025',
            subtitle: 'Yuk segera amankan tiket mudik mu sekarang juga sebelum kehabisan...',
            time: '10:00',
          ),
          _buildNotificationItem(
            icon: Icons.check_circle_outline,
            title: 'Tiket anda sudah dibayar lunas',
            subtitle: 'Terimakasih sudah membeli tiket di new shantika nikmati perjalanannya.',
            time: '10:00',
          ),
          _buildNotificationItem(
            icon: FontAwesome.money_bill_1,
            title: 'Segera Bayar Tiket yang sudah anda pesan',
            subtitle: 'Bayar tiket anda dan nikmati perjalanan bus new shantika',
            time: '10:00',
          ),
          _buildNotificationItem(
            icon: FontAwesome.money_bill_1,
            title: 'Segera Bayar Tiket yang sudah anda pesan',
            subtitle: 'Bayar tiket anda dan nikmati perjalanan bus new shantika',
            time: '10:00',
          ),
        ],
      ),
    );
  }

  Widget _buildDateSection(String date) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingL, vertical: AppStyles.paddingM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(date, style: AppStyles.menufav2),
          Text('Baca Semua', style: AppStyles.seeAll),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppStyles.paddingM,
        vertical: AppStyles.paddingM,
      ),
      decoration: BoxDecoration(
        color: AppStyles.light,
        border: Border(
          bottom: BorderSide(color: AppStyles.grey3, width: 0.8),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppStyles.secondary, size: 28),
          SizedBox(width: AppStyles.spaceM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.artikel.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: AppStyles.spaceXS),
                Text(
                  subtitle,
                  style: AppStyles.riwayat.copyWith(
                    color: AppStyles.grey3,
                  ),
                ),
                SizedBox(height: AppStyles.spaceM),
              ],
            ),
          ),
          Text(
            time,
            style: AppStyles.seeAll.copyWith(
              fontSize: 12,
              color: AppStyles.secondary,
            ),
          ),
        ],
      ),
    );
  }

}
