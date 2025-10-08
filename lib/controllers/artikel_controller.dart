import 'package:get/get.dart';

import '../models/artikel_model.dart';

class ArtikelController extends GetxController{

  var searchQuery = "".obs;

  List<Map<String, String>> get filteredArticles {
    if (searchQuery.isEmpty) return articles;
    return articles
        .where((a) =>
        a["title"]!.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  final List<Map<String, String>> articles = [
    {
      "title": "Pengalaman terbaik dalam perjalanan selama pandemi",
      "image": "images/artikel1.png",
    },
    {
      "title": "Penerapan Protokol Kesehatan Dalam perjalanan",
      "image": "images/artikel2.png",
    },
    {
      "title": "Pengalaman terbaik dalam perjalanan selama pandemi",
      "image": "images/artikel3.png",
    },
    {
      "title": "Penerapan Protokol Kesehatan Dalam perjalanan",
      "image": "images/artikel4.png",
    },
  ];

  final artikelList = <ArtikelModel>[
    ArtikelModel(
      title: "1. Penerapan Protokol Kesehatan",
      description:
      "Mengutamakan keselamatan dengan masker, hand sanitizer, dan menjaga jarak, memberikan rasa aman selama perjalanan.",
      image: "images/dokter.jpg",
    ),
    ArtikelModel(
      title: "2. Menemukan Keindahan Baru",
      description:
      "Mengeksplorasi tempat-tempat terpencil yang sebelumnya jarang dikunjungi.",
      image: "images/dokter.jpg",
    ),
    ArtikelModel(
      title: "3. Destinasi Lebih Sepi",
      description:
      "Wisata yang biasanya ramai menjadi lebih tenang, memungkinkan pengalaman yang lebih intim dengan alam.",
      image: "images/dokter.jpg",
    ),
  ].obs;

}