import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/app_styles.dart';

class KebijakanPrivasiPage extends StatelessWidget {
  const KebijakanPrivasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.light,
      appBar: _header(),
      body: _content(),
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
            "Kebijakan Privasi",
            style: AppStyles.heading,
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingL, vertical: AppStyles.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppStyles.spaceXXXS),
          Text(
            'New Shantika ("Kami" atau "Aplikasi") berkomitmen untuk melindungi privasi Anda. Kebijakan Privasi ini menjelaskan bagaimana Kami mengumpulkan, menggunakan, dan melindungi informasi pribadi yang Anda berikan ketika menggunakan Aplikasi New Shantika. Dengan menggunakan Aplikasi ini, Anda setuju dengan ketentuan Kebijakan Privasi ini.',
            style: AppStyles.riwayat,
          ),
          SizedBox(height: AppStyles.spaceL),
          _section(
            number: '1',
            title: 'Informasi yang Kami Kumpulkan',
            content: 'Kami dapat mengumpulkan informasi pribadi yang mencakup namun tidak terbatas pada:',
            items: [
              'Informasi Identitas: Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.',
              'Informasi Identitas: Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.',
            ],
          ),
          SizedBox(height: AppStyles.spaceL),
          _section(
            number: '2',
            title: 'Informasi yang Kami Kumpulkan',
            content: 'Kami dapat mengumpulkan informasi pribadi yang mencakup namun tidak terbatas pada:',
            items: [
              'Informasi Identitas: Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.',
              'Informasi Identitas: Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.',
            ],
          ),
          SizedBox(height: AppStyles.spaceL),
          _section(
            number: '3',
            title: 'Informasi yang Kami Kumpulkan',
            content: 'Kami dapat mengumpulkan informasi pribadi yang mencakup namun tidak terbatas pada:',
            items: [
              'Informasi Identitas: Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.',
              'Informasi Identitas: Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.',
            ],
          ),
          SizedBox(height: AppStyles.spaceL),
          _section(
            number: '4',
            title: 'Informasi yang Kami Kumpulkan',
            content: 'Kami dapat mengumpulkan informasi pribadi yang mencakup namun tidak terbatas pada:',
            items: [
              'Informasi Identitas: Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.',
              'Informasi Identitas: Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.',
            ],
          ),
        ],
      ),
    );
  }

  Widget _section({
    required String number,
    required String title,
    required String content,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number. $title',
          style: AppStyles.riwayat.copyWith(color: AppStyles.dark, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: AppStyles.spaceM),
        Text(
          content,
          style: AppStyles.riwayat.copyWith(color: AppStyles.dark),
        ),
        SizedBox(height: AppStyles.spaceM),
        ...items.map((item) => Padding(
          padding: EdgeInsets.only(left: AppStyles.paddingS, bottom: AppStyles.paddingS),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('• ', style: AppStyles.riwayat.copyWith(color: AppStyles.dark)),
              Expanded(
                child: Text(
                  item,
                  style: AppStyles.riwayat.copyWith(color: AppStyles.dark),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
