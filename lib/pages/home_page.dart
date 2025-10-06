import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controllers.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              _searchTicket(),
              _menuFavorit(),
              _riwayat(),
              _promo(),
              _artikel(),
              _testimoni(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  // Header
  Widget _header() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff0a0f4d), Color(0xff1f2a74)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("New Shantika",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          Icon(Icons.notifications, color: Colors.white),
        ],
      ),
    );
  }
}
