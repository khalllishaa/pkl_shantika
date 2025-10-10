import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/app_styles.dart';

class TentangKamiPage extends StatelessWidget {
  const TentangKamiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.light,
      appBar: _header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppStyles.spacename),
            Text(
              "NEW SHANTIKA",
              style: AppStyles.shantika
            ),
            SizedBox(height: AppStyles.spacename),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingXL),
              child: Image.asset(
                'images/bus.jpg',
                height: 242,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: AppStyles.spacename),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingXL),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppStyles.menufav.copyWith(color: AppStyles.grey3, fontSize: 14),
                  children: [
                    TextSpan(
                      text: "New Shantika ",
                      style: AppStyles.menufav2
                    ),
                    TextSpan(
                      text: "berdiri dari tahun 13 Maret 2005, kami merupakan jasa transportasi bus dari Jepara dan telah menjalankan busnya di seluruh pelosok Indonesia. Kami merupakan perusahaan bus yang menyediakan berbagai jenis layanan bus yang menghubungkan berbagai jalur kota. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc facilisis vitae id feugiat turpis imperdiet pharetra. Tempus velit non pharetra orci malesuada lectus. Lacus in nunc pretium semper adipiscing.",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppStyles.spaceXXL),
            // Social Media Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialMediaButton(
                  icon: BoxIcons.bxl_instagram,
                  onTap: () => _launchUrl('https://instagram.com'),
                ),
                SizedBox(width: 32),
                _socialMediaButton(
                  icon: Icons.email_outlined,
                  onTap: () => _launchUrl('mailto:info@newshantika.com'),
                ),
                SizedBox(width: 32),
                _socialMediaButton(
                  icon: Bootstrap.facebook,
                  onTap: () => _launchUrl('https://newshantika.com'),
                ),
              ],
            ),
            SizedBox(height: AppStyles.spaceXXL),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppStyles.spacename),
              child: Text(
                "Jl. Kudus-Jepara KM 9 Desa Papringan\nKecamatan Kaliwungu Kabupaten Kudus\nJawa Tengah 59361",
                textAlign: TextAlign.center,
                style: AppStyles.search.copyWith(color: AppStyles.grey3),
              ),
            ),
            SizedBox(height: AppStyles.spacename),
          ],
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
            "Tentang Kami",
            style: AppStyles.heading,
          ),
        ),
      ),
    );
  }

  Widget _socialMediaButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Color(0xFF1E1B4B), // Dark blue/navy color
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      Get.snackbar(
        'Error',
        'Tidak dapat membuka link',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}