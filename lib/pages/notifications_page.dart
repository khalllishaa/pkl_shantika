import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          title: const Text(
            'Notifikasi',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3)),
              ),
              child: const TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,
                indicatorWeight: 2,
                tabs: [
                  Tab(text: 'Semua 16'),
                  Tab(text: 'Belum Dibaca 7'),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            NotificationList(),
            NotificationList(),
          ],
        ),
      ),
    );
  }
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
            icon: Icons.local_offer_outlined,
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
            icon: Icons.confirmation_number_outlined,
            title: 'Segera Bayar Tiket yang sudah anda pesan',
            subtitle: 'Bayar tiket anda dan nikmati perjalanan bus new shantika',
            time: '10:00',
          ),
          _buildDateSection('8 Februari 2024'),
          _buildNotificationItem(
            icon: Icons.local_offer_outlined,
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
            icon: Icons.confirmation_number_outlined,
            title: 'Segera Bayar Tiket yang sudah anda pesan',
            subtitle: 'Bayar tiket anda dan nikmati perjalanan bus new shantika',
            time: '10:00',
          ),
          _buildNotificationItem(
            icon: Icons.confirmation_number_outlined,
            title: 'Segera Bayar Tiket yang sudah anda pesan',
            subtitle: 'Bayar tiket anda dan nikmati perjalanan bus new shantika',
            time: '10:00',
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDateSection(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(date, style: const TextStyle(fontWeight: FontWeight.w600)),
          const Text('Baca Semua', style: TextStyle(color: Colors.blue)),
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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 0.8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),
          Text(time, style: const TextStyle(color: Colors.blue, fontSize: 12)),
        ],
      ),
    );
  }
}
