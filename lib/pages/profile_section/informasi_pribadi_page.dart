import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pkl_sahntikha/components/app_styles.dart';
import 'package:pkl_sahntikha/components/reuse_button.dart';

class InformasiPribadiPage extends StatefulWidget {
  const InformasiPribadiPage({super.key});

  @override
  State<InformasiPribadiPage> createState() => _InformasiPribadiPageState();
}

class _InformasiPribadiPageState extends State<InformasiPribadiPage> {
  final _namaController = TextEditingController(text: "Anastasya Carolina");
  final _telpController = TextEditingController(text: "083745552724");
  final _emailController = TextEditingController(text: "anastasyacarolina@gmail.com");
  final _tempatLahirController = TextEditingController(text: "Semarang");
  final _tanggalLahirController = TextEditingController(text: "03 Oktober 2006");
  final _alamatController = TextEditingController(text: "Jl Sentiyaki Raya No 48, Semarang Utara");
  String selectedGender = "Wanita";

  @override
  void dispose() {
    _namaController.dispose();
    _telpController.dispose();
    _emailController.dispose();
    _tempatLahirController.dispose();
    _tanggalLahirController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.light,
      appBar: _header(),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 100),
              child: _content(),
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
            "Informasi Pribadi",
            style: AppStyles.heading,
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return Padding(
      padding: EdgeInsets.all(AppStyles.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppStyles.spaceM),
          _profileSection(context),
          SizedBox(height: 36),

          // Nama Lengkap
          Text(
            "Nama Lengkap",
            style: AppStyles.riwayat2.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: AppStyles.spaceS),
          _textField(_namaController),
          SizedBox(height: AppStyles.spaceM),

          // Nomor Telepon
          Text(
            "Nomor Telepon",
            style: AppStyles.riwayat2.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: AppStyles.spaceprofile),
          _textField(_telpController, keyboardType: TextInputType.phone),
          SizedBox(height: AppStyles.spaceM),

          // Email
          Text(
            "Email",
            style: AppStyles.riwayat2.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: AppStyles.spaceprofile),
          _textField(_emailController, keyboardType: TextInputType.emailAddress),
          SizedBox(height: AppStyles.spaceM),

          // Tempat Lahir
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tempat Lahir",
                      style: AppStyles.riwayat2.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: AppStyles.spaceprofile),
                    _textField(_tempatLahirController),
                  ],
                ),
              ),
              SizedBox(width: AppStyles.spaceM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tempat Lahir",
                      style: AppStyles.riwayat2.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: AppStyles.spaceprofile),
                    _textField(_tanggalLahirController),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppStyles.spaceM),

          // Gender
          Text(
            "Gender",
            style: AppStyles.riwayat2.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: AppStyles.spaceprofile),
          _genderSelector(),
          SizedBox(height: AppStyles.spaceM),

          // Alamat Lengkap
          Text(
            "Alamat Lengkap",
            style: AppStyles.riwayat2.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: AppStyles.spaceprofile),
          _textField(_alamatController, maxLines: 4),
        ],
      ),
    );
  }

  Widget _textField(
      TextEditingController controller, {
        int maxLines = 1,
        TextInputType keyboardType = TextInputType.text,
      }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppStyles.radiusL),
        border: Border.all(color: AppStyles.grey2, width: 1),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: AppStyles.menufav2.copyWith(fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppStyles.paddingM,
            vertical: 14,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _genderSelector() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingM, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppStyles.radiusL),
        border: Border.all(color: AppStyles.grey2, width: 1),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = "Pria";
              });
            },
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedGender == "Pria" ? AppStyles.primary : AppStyles.grey2,
                  ),
                  child: Icon(
                    Icons.male,
                    color: selectedGender == "Pria" ? AppStyles.light : AppStyles.light,
                    size: AppStyles.iconS,
                  ),
                ),
                SizedBox(width: AppStyles.spaceXXS),
                Text(
                    "Pria",
                    style: AppStyles.menufav2.copyWith(fontSize: 16)
                ),
              ],
            ),
          ),
          SizedBox(width: AppStyles.space),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = "Wanita";
              });
            },
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedGender == "Wanita" ? AppStyles.primary : AppStyles.grey2,
                  ),
                  child: Icon(
                    Icons.female,
                    color: selectedGender == "Wanita" ? AppStyles.light : AppStyles.light,
                    size: AppStyles.iconS,
                  ),
                ),
                SizedBox(width: AppStyles.spaceXXS),
                Text(
                  "Wanita",
                  style: AppStyles.menufav2.copyWith(
                      fontSize: 16
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomSection() {
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
      child: ReuseButton(
        text: "Simpan",
        height: 48,
        fontSize: 16,
        radius: 12,
        backgroundColor: AppStyles.primary,
        textColor: AppStyles.light,
          onPressed: () {
          Get.back();
            Get.snackbar(
              "", "",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppStyles.lunas,
              colorText: AppStyles.light,
              duration: Duration(seconds: 2),
              margin: EdgeInsets.all(AppStyles.paddingM),
              borderRadius: AppStyles.radiusL,
              titleText: Row(
                children: [
                  Icon(BoxIcons.bx_check_circle, color: AppStyles.light, size: 20),
                  SizedBox(width: AppStyles.spaceXXS),
                  Text(
                    "Sukses",
                    style: AppStyles.menufav2.copyWith(color: AppStyles.light)
                  ),
                ],
              ),
              messageText: Text(
                "Data berhasil disimpan",
                style: AppStyles.menufav2.copyWith(fontSize: 12, color: AppStyles.light)
              ),
            );
          }
      ),
    );
  }

  Widget _profileSection(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('images/profile.png'),
              backgroundColor: AppStyles.grey2,
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: AppStyles.dark.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    _showImagePickerBottomSheet(context);
                  },
                  child: Icon(
                    IconlyLight.camera,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: AppStyles.spacename),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Anastasya Carolina",
                style: AppStyles.search.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: AppStyles.spaceS),
              Row(
                children: [
                  Text(
                    "Member New Shantika",
                    style: AppStyles.menufav2.copyWith(
                      color: AppStyles.grey3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: AppStyles.spaceXXXS),
                  SvgPicture.asset(
                    "images/icons/check_filled.svg",
                    width: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("From Camera"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text("From Files"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

}