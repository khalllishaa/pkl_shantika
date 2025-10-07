import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    {"icon": Icons.confirmation_number, "title": "Pesan Tiket"},
    {"icon": Icons.directions_bus, "title": " Informasi Kelas Armada"},
    {"icon": Icons.info, "title": "Informasi Perusahaan"},
    {"icon": Icons.shop, "title": " New Shantika Shop"},
    {"icon": Icons.facebook, "title": "Sosial Media"},
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
  var promos = [
    {
      "title": "Promo Mudik 2024",
      "desc": "Potongan hingga Rp50.000",
      "date": "28 April 2025",
    }
  ].obs;

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
