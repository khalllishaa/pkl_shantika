import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles{
  // Color Apps
  static const Color light = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF191919);
  static const Color grey1 = Color(0xFF606060);
  static const Color grey2 = Color(0xFFE8E8E8);
  static const Color grey3 = Color(0xFF989696);
  static const Color bottomnavc = Color(0xFF9E9E9E);
  static const Color primary = Color(0xFF292861);
  static const Color primary2 = Color(0xFF292860);
  static const Color secondary = Color(0xFF0C44FF);
  static const Color stars = Color(0xFFF8BA2C);
  static const Color selengkapnya = Color(0xFFFF3800);
  static const gradientMenu = LinearGradient(
    colors: [Color(0xFF292861), Color(0xFF67717A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const gradientPromo = LinearGradient(
    colors: [Color(0xFF2D3C8A), Color(0xFF3A4BA4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );


  // Text Style
  static final TextStyle bottomnav = GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: AppStyles.primary);
  static final TextStyle bottomnav2 = GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.normal, color: AppStyles.grey1);
  static final TextStyle bottomnavunselected = GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.normal, color: AppStyles.bottomnavc);
  static final TextStyle tiket1 = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: AppStyles.dark);
  static final TextStyle tiket2 = GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.normal, color: AppStyles.dark);
  static final TextStyle menufav = GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500, color: AppStyles.dark);
  static final TextStyle menufav2 = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppStyles.dark);
  static final promoTitle = GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold, color: light);
  static final promoDesc = GoogleFonts.poppins(fontSize: 10, color: light);
  static final promoDate = GoogleFonts.poppins(fontSize: 12, fontStyle: FontStyle.italic, color: light);
  static final seeAll = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: secondary);
  static final riwayat = GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: AppStyles.grey3);
  static final riwayat2 = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: AppStyles.dark);
  static final heading = GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500, color: AppStyles.dark);
  static final search = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: AppStyles.dark);
  static final artikel = GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: AppStyles.dark);

  // Image & widget
  static const double logo = 200.0;
  static const double logoHeading = 55.0;
  static const double profile = 70.0;
  static const double categoryLineHeight = 64.0;
  static const double categoryLineHeightt = 90.0;
  static const double categoryImageSize = 80.0;
  static const double cardWidth = 280.0;
  static const double detailIconSize = 45.0;
  static const double IconSize = 90.0;
  static const double bottomNavHeight = 90.0;
  static const double classCardHeight = 126.0;
  static const double detailHeaderHeight = 100.0;
  static const double detailHeaderRadius = 50.0;
  static const double teacherHeight = 100.0;
  static const double classCard = 310.0;
  static const double classCard2 = 130.0;

  // Icon Sizes
  static const double iconS = 20.0;
  static const double iconM = 17.0;
  static const double iconL = 25.0;
  static const double iconXL = 30.0;
  static const double avatarIconSize = 30.0;
  static const double classImageSize = 104.0;

  // Padding & Margin
  static const double paddingXXS = 2.0;
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 12.0;
  static const double paddingL = 15.0;
  static const double paddingXL = 20.0;
  static const double paddingXXL = 30.0;

  // Spacing
  static const double spaceXXS = 2.0;
  static const double spaceXS = 5.0;
  static const double spaceS = 10.0;
  static const double spaceM = 12.0;
  static const double spaceL = 16.0;
  static const double space = 28.0;
  static const double spaceXL = 45.0;
  static const double spaceXXL = 48.0;
  static const double spaceeXL = 190.0;

  // Border Radius
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 10.0;
  static const double radiusXL = 20.0;
  static const double radiussL = 16.0;
  static const double radius = 40.0;
  static const double radiusXXL = 50.0;
}