import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeController extends GetxController {

  // form tiket
  var departure = "".obs;
  var arrival = "".obs;

  // Slider
  final sliderImages = [
    "images/green_bus.png",
    "images/red_bus.png",
    "images/yellow_bus.png",
  ];

  // Menu Favorit
  final menus = [
    {"icon": IconlyLight.ticket, "title": "Pesan Tiket"},
    {"icon": Icons.directions_bus, "title": "Informasi Kelas Armada"},
    {"icon": IconlyLight.info_square, "title": "Informasi Perusahaan"},
    {"icon": IconlyLight.buy, "title": "New Shantika Shop"},
    {"icon": FontAwesome.ticket_solid, "title": "Sosial Media"},
    {"icon": Icons.group, "title": "Informasi Agen"},
    {"icon": Icons.credit_card, "title": "E-Member"},
    {"icon": Icons.language, "title": "Website"},
  ];

  // Riwayat tiket
  var history = [
    {
      "title": "Bus 10 • Executive Big Top",
      "from": "Krapyak - Semarang",
      "to": "Gejayan - Sleman",
      "date": "11 Februari 2025 - 20:30",
      "price": "230.000",
    }
  ].obs;

  // Promo
  final promoList = [
    {
      "title": "Promo Mudik 2024",
      "subtitle": "Potongan hingga Rp50.000",
      "date": "28 April 2025",
      "imagePath": "images/promo.png",
    },
    {
      "title": "Promo Akhir Tahun",
      "subtitle": "Diskon 20%",
      "date": "31 Desember 2025",
      "imagePath": "images/promo.png",
    },
  ];

  // Artikel
  var articles = <Map<String, String>>[
    {
      "title": "PO New Shantika Tetap Jalan Selama Larangan",
      "image": "images/bus1.png"
    },
    {
      "title": "PO New Shantika Siapkan Armada Dream Coach",
      "image": "images/bus2.png"
    },
    {
      "title": "PO New Shantika Rilis Rute Baru",
      "image": "images/bus3.png"
    },
  ].obs;

  final testimonials = [
    {
      "name": "Esther Howard",
      "date": "13 Feb 2025",
      "busClass": "Super Executive",
      "rating": 5,
      "review":
      "Sangat menyenangkan melakukan perjalanan bersama bus Shantika. Supirnya baik dan ramah, ACnya dingin, dan saya bisa tertidur pulas.. :D",
      "images": [
        "images/testimoni.png",
        "images/testimoni.png",
        "images/testimoni.png",
      ],
    },
  ];

  // Fungsi
  void searchTicket() {
    print("Cari tiket dari $departure ke $arrival");
  }

  void addReview(String review) {
    testimonials.add({
      "name": "User Baru",
      "date": "Today",
      "rating": 5,
      "review": review,
    });
  }
}
