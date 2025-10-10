import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pkl_sahntikha/components/app_styles.dart';
import 'package:pkl_sahntikha/components/custom_card.dart';
import 'package:pkl_sahntikha/components/reuse_button.dart';

import '../../components/title_home.dart';

class DetailPesananPage extends StatelessWidget {
  final Map<String, dynamic> pesananData;

  const DetailPesananPage({super.key, required this.pesananData});

  @override
  Widget build(BuildContext context) {
    bool isSudahReview = pesananData["status"]?.toLowerCase() == "sudah review";

    return Scaffold(
      backgroundColor: AppStyles.light,
      appBar: _header(),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: isSudahReview ? 80 : 120),
              child: _detailContent(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _bottomSection(),
          ),
        ],
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
              color: Colors.black.withOpacity(0.08),
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
            "Detail Pesanan",
            style: AppStyles.heading,
          ),
        ),
      ),
    );
  }

  Widget _detailContent() {
    bool isSudahReview = pesananData["status"]?.toLowerCase() == "sudah review";

    return Padding(
      padding: EdgeInsets.all(AppStyles.paddingL),
      child: Column(
        children: [
          // Bus Info Card
          CustomCardContainer(
            padding: EdgeInsets.all(AppStyles.paddingM),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'images/icons/bus.svg',
                    width: 32,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      AppStyles.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(width: AppStyles.spaceM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pesananData["title"]?.split("•")[0].trim() ?? "Bus 10",
                        style: AppStyles.heading.copyWith(fontSize: 18),
                      ),
                      Text(
                        pesananData["title"]?.split("•").length > 1
                            ? pesananData["title"].split("•")[1].trim()
                            : "Executive",
                        style: AppStyles.riwayat.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppStyles.secondary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'images/icons/car_seat.svg',
                        width: 14,
                        height: 14,
                        colorFilter: ColorFilter.mode(
                          AppStyles.secondary,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "${pesananData["jumlah_penumpang"] ?? 2} Penumpang",
                        style: AppStyles.riwayat2.copyWith(
                          color: AppStyles.secondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppStyles.spaceM),

          // Informasi Perjalanan
          CustomCardContainer(
            padding: EdgeInsets.all(AppStyles.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Informasi Perjalanan",
                  style: AppStyles.heading.copyWith(fontSize: 16),
                ),
                SizedBox(height: AppStyles.spaceM),
                _infoRow(
                  IconlyBold.location,
                  "Agen Keberangkatan",
                  pesananData["from"] ?? "Krapyak - Semarang",
                  pesananData["depart_time"] ?? "07:30",
                  AppStyles.grey1,
                ),
                SizedBox(height: AppStyles.spaceM),
                _infoRow(
                  IconlyBold.location,
                  "Agen Tujuan",
                  pesananData["to"] ?? "Gejayan - Sleman",
                  pesananData["arrive_time"] ?? "15:30",
                  AppStyles.secondary,
                ),
                SizedBox(height: AppStyles.spaceM),
                Row(
                  children: [
                    Icon(IconlyBold.calendar, color: AppStyles.grey1, size: 20),
                    SizedBox(width: AppStyles.spaceS),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tanggal Keberangkatan",
                          style: AppStyles.riwayat,
                        ),
                        Text(
                          "${pesananData["date"] ?? "12 Mei 2025"} ${pesananData["depart_time"] ?? "07:30"}",
                          style: AppStyles.riwayat2.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: AppStyles.spaceM),

          // Review Card - Only show if status is "sudah review"
          if (isSudahReview) ...[
            _reviewCard(),
            SizedBox(height: AppStyles.spaceM),
          ],

          // Informasi Pembayaran
          CustomCardContainer(
            padding: EdgeInsets.all(AppStyles.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Informasi Pembayaran",
                  style: AppStyles.heading.copyWith(fontSize: 16),
                ),
                SizedBox(height: AppStyles.spaceM),
                _paymentRow(
                  IconlyBold.ticket,
                  "Total Harga Tiket",
                  "Rp${pesananData["price"] ?? "400.000"}",
                ),
                SizedBox(height: AppStyles.spaceM),
                _paymentRow(
                  IconlyBold.profile,
                  "ID Membership",
                  pesananData["id_membership"] ?? "SHNTK00127",
                ),
                SizedBox(height: AppStyles.spaceM),
                _paymentRow(
                  IconlyBold.discount,
                  "Potongan Membership 5%",
                  "Rp${pesananData["potongan"] ?? "20.000"}",
                ),
                SizedBox(height: AppStyles.spaceM),
                _paymentRow(
                  IconlyBold.wallet,
                  "Metode Pembayaran",
                  pesananData["metode_pembayaran"] ?? "Pembayaran Instant",
                ),
                SizedBox(height: AppStyles.spaceM),
                Row(
                  children: [
                    Icon(IconlyBold.info_circle,
                        color: AppStyles.grey1, size: 20),
                    SizedBox(width: AppStyles.spaceS),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Status",
                          style: AppStyles.riwayat,
                        ),
                        Text(
                          _getStatusText(pesananData["status"]),
                          style: AppStyles.riwayat2.copyWith(
                            fontWeight: FontWeight.w600,
                            color: _getStatusColor(pesananData["status"]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _reviewCard() {
    return CustomCardContainer(
      padding: EdgeInsets.all(AppStyles.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Review",
            style: AppStyles.heading.copyWith(fontSize: 16),
          ),
          SizedBox(height: AppStyles.spaceM),

          Row(
            children: List.generate(5, (index) {
              return Icon(
                IconlyBold.star,
                color: AppStyles.stars,
                size: 20,
              );
            }),
          ),
          SizedBox(height: AppStyles.spaceS),

          // Review Text
          Text(
            pesananData["review_text"] ??
                "Sangat menyenangkan melakukan perjalanan bersama bus Shantika. Supirnya baik dan ramah, ACnya dingin, dan saya bisa tertidur pulas.. :D",
            style: AppStyles.riwayat2.copyWith(
              fontSize: 13,
              height: 1.5,
            ),
          ),
          SizedBox(height: AppStyles.spaceM),

          // Review Images
          Row(
            children: [
              ...List.generate(4, (index) {
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppStyles.grey2,
                    image: DecorationImage(
                      image: AssetImage('images/testimoni.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppStyles.bottomnavc.withOpacity(0.1),
                ),
                child: Center(
                  child: Text(
                    "+3",
                    style: AppStyles.tiket1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoRow(
      IconData icon, String label, String title, String time, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 20),
        SizedBox(width: AppStyles.spaceS),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppStyles.riwayat,
              ),
              Text(
                "$title • $time",
                style: AppStyles.riwayat2.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _paymentRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: AppStyles.grey1, size: 20),
        SizedBox(width: AppStyles.spaceS),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppStyles.riwayat,
              ),
              Text(
                value,
                style: AppStyles.riwayat2.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bottomSection() {
    bool isSudahReview = pesananData["status"]?.toLowerCase() == "sudah review";

    return Container(
      padding: EdgeInsets.all(AppStyles.paddingL),
      decoration: BoxDecoration(
        color: AppStyles.light,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Pembayaran",
                style: AppStyles.riwayat2,
              ),
              Text(
                "Rp${pesananData["price"] ?? "400.000"}",
                style: AppStyles.heading.copyWith(fontSize: 18),
              ),
            ],
          ),
          // Only show button if status is NOT "sudah review"
          if (!isSudahReview) ...[
            SizedBox(height: AppStyles.spaceM),
            ReuseButton(
              text: "Lihat Tiket",
              height: 50,
              fontSize: 16,
              radius: 12,
              backgroundColor: AppStyles.primary,
              textColor: AppStyles.light,
              onPressed: () {},
            ),
          ],
        ],
      ),
    );
  }

  String _getStatusText(String? status) {
    switch (status?.toLowerCase()) {
      case "lunas":
        return "Lunas";
      case "sudah ditukarkan":
        return "Sudah Ditukarkan";
      case "sudah review":
        return "Sudah Review";
      default:
        return "Lunas";
    }
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case "lunas":
        return AppStyles.lunas;
      case "sudah ditukarkan":
        return AppStyles.secondary2;
      case "sudah review":
        return AppStyles.primary;
      default:
        return AppStyles.primary;
    }
  }
}