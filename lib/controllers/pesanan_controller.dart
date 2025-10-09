import 'dart:ui';

import 'package:get/get.dart';

import '../components/app_styles.dart';

class StatusStyle {
  final String text;
  final Color color;

  StatusStyle(this.text, this.color);
}

class PesananController extends GetxController{

  // 🔹 Riwayat tiket
  var pesanan = [
    {
      "title": "Bus 10 • Executive Big Top",
      "from": "Krapyak - Semarang",
      "to": "Gejayan - Sleman",
      "date": "11 Februari 2025",
      "depart_time": "20:30",
      "arrive_time": "23:45",
      "price": "230.000",
      "status": "lunas",
    },
    {
      "title": "Bus 17 • Super Executive",
      "from": "Tugu - Jogja",
      "to": "Kudus - Terminal Jati",
      "date": "14 Februari 2025",
      "depart_time": "09:00",
      "arrive_time": "13:00",
      "price": "210.000",
      "status": "sudah ditukarkan",
    },
    {
      "title": "Bus 21 • Dream Coach",
      "from": "Semarang - Kaligawe",
      "to": "Jakarta - Kalideres",
      "date": "2 Maret 2025",
      "depart_time": "22:00",
      "arrive_time": "05:30",
      "price": "330.000",
      "status": "sudah review",
    },
  ].obs;

  // 🔹 Riwayat tiket
  var history = [
    {
      "title": "Bus 10 • Executive Big Top",
      "from": "Krapyak - Semarang",
      "to": "Gejayan - Sleman",
      "date": "11 Februari 2025",
      "depart_time": "20:30",
      "arrive_time": "23:45",
      "price": "230.000",
      "status": "lunas",
    },
    {
      "title": "Bus 17 • Super Executive",
      "from": "Tugu - Jogja",
      "to": "Kudus - Terminal Jati",
      "date": "14 Februari 2025",
      "depart_time": "09:00",
      "arrive_time": "13:00",
      "price": "210.000",
      "status": "lunas",
    },
    {
      "title": "Bus 21 • Dream Coach",
      "from": "Semarang - Kaligawe",
      "to": "Jakarta - Kalideres",
      "date": "2 Maret 2025",
      "depart_time": "22:00",
      "arrive_time": "05:30",
      "price": "330.000",
      "status": "lunas",
    },
  ].obs;

  StatusStyle getStatusStyle(String? status) {
    switch (status?.toLowerCase()) {
      case "lunas":
        return StatusStyle("Lunas", AppStyles.lunas);
      case "sudah ditukarkan":
        return StatusStyle("Sudah Ditukarkan", AppStyles.secondary2);
      case "sudah review":
        return StatusStyle("Sudah Review", AppStyles.primary);
      default:
        return StatusStyle("Lunas", AppStyles.primary);
    }
  }


}