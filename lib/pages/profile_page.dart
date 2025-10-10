import 'package:flutter/material.dart';
import 'package:pkl_sahntikha/components/app_styles.dart';
import 'package:pkl_sahntikha/components/custom_card.dart';
import 'package:pkl_sahntikha/components/reuse_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.light,
      appBar: _header(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppStyles.spaceL),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/profile.png'),
                backgroundColor: AppStyles.grey2,
              ),
              SizedBox(height: AppStyles.spaceM),

              // Name
              Text(
                "Anastasya Carolina",
                style: AppStyles.heading.copyWith(fontSize: 18),
              ),
              SizedBox(height: AppStyles.spaceXS),

              // Phone Number
              Text(
                "087374543899",
                style: AppStyles.riwayat.copyWith(fontSize: 14),
              ),
              SizedBox(height: AppStyles.spaceL),

              // Menu Items
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingL),
                child: Column(
                  children: [
                    _menuItem(
                      icon: Icons.person_outline,
                      text: "Informasi Pribadi",
                      onTap: () {},
                    ),
                    SizedBox(height: AppStyles.spaceS),

                    _menuItem(
                      icon: Icons.notifications_none,
                      text: "Notifikasi",
                      onTap: () {},
                    ),
                    SizedBox(height: AppStyles.spaceS),

                    _menuItem(
                      icon: Icons.info_outline,
                      text: "Tentang Kami",
                      onTap: () {},
                    ),
                    SizedBox(height: AppStyles.spaceS),

                    _menuItem(
                      icon: Icons.shield_outlined,
                      text: "Kebijakan Privasi",
                      onTap: () {},
                    ),
                    SizedBox(height: AppStyles.spaceS),

                    _menuItem(
                      icon: Icons.description_outlined,
                      text: "Syarat dan Ketentuan",
                      onTap: () {},
                    ),
                    SizedBox(height: AppStyles.spaceS),

                    _menuItem(
                      icon: Icons.help_outline,
                      text: "FAQ",
                      onTap: () {},
                    ),
                    SizedBox(height: AppStyles.spaceS),

                    _menuItem(
                      icon: Icons.star_outline,
                      text: "Beri Nilai App Kami",
                      trailing: Text(
                        "Versi 1.20.5",
                        style: AppStyles.riwayat.copyWith(fontSize: 12),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(height: AppStyles.spaceL),

                    // Logout Button
                    ReuseButton(
                        text: "Keluar Akun",
                        onPressed: (){},
                      backgroundColor: AppStyles.logout,
                      radius: AppStyles.radiusL,
                    ),
                    SizedBox(height: AppStyles.spaceL),
                  ],
                ),
              ),
            ],
          ),
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
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Profil",
            style: AppStyles.heading,
          ),
          centerTitle: true,
        ),
      ),
    );
  }

  Widget _menuItem({
    required IconData icon,
    required String text,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return CustomCardContainer(
      backgroundColor: AppStyles.background,
      height: 56,
      boxShadow: [],
      padding: EdgeInsets.symmetric(
        horizontal: AppStyles.paddingM,
        vertical: AppStyles.paddingL,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppStyles.radiussL),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppStyles.dark,
              size: 24,
            ),
            SizedBox(width: AppStyles.spaceM),
            Expanded(
              child: Text(
                text,
                style: AppStyles.menufav2
              ),
            ),
            if (trailing != null) ...[
              trailing,
              SizedBox(width: AppStyles.spaceS),
            ],
            Icon(
              Icons.chevron_right,
              color: AppStyles.dark,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}