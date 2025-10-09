import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../components/app_styles.dart';
import '../components/custom_card.dart';
import '../models/contact_models.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.light,
      appBar: _header(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppStyles.paddingL),
          child: Obx(() {
            final contacts = controller.contacts;
            return ListView.separated(
              itemCount: contacts.length,
              separatorBuilder: (_, __) => SizedBox(height: AppStyles.spaceM),
              itemBuilder: (context, index) {
                final item = contacts[index];
                return _chatCard(item);
              },
            );
          }),
        ),
      ),
    );
  }

  PreferredSizeWidget _header() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 4),
      child: Container(
        decoration: BoxDecoration(
          color: AppStyles.light,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Chat",
            style: AppStyles.heading,
          ),
          centerTitle: true,
        ),
      ),
    );
  }

  Widget _chatCard(ContactItem item) {
    return GestureDetector(
      onTap: () => controller.openLink(item.link),
      child: CustomCardContainer(
        padding: EdgeInsets.symmetric(
          horizontal: AppStyles.paddingL,
          vertical: AppStyles.paddingM,
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(AppStyles.paddingS),
              child: SvgPicture.asset(
                item.iconPath,
                width: AppStyles.iconXL,
                height: AppStyles.iconXL,
              ),
            ),
            SizedBox(width: AppStyles.spaceM),
            Expanded(
              child: Text(
                item.title,
                style: AppStyles.search,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
