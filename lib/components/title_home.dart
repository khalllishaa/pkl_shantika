import 'package:flutter/material.dart';
import 'package:pkl_sahntikha/components/app_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Color? lineColor;

  const SectionTitle({
    Key? key,
    required this.title,
    this.lineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppStyles.spaceS,
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: lineColor ?? AppStyles.secondary,
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          SizedBox(width: AppStyles.spaceM),
          Text(
            title,
            style: AppStyles.menufav2.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
