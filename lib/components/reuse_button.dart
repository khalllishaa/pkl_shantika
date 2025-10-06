import 'package:flutter/material.dart';
import 'app_styles.dart';

class ReuseButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final bool isFullWidth;
  final double? fontSize;
  final double? radius;

  const ReuseButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppStyles.primary,
    this.textColor = AppStyles.light,
    this.borderColor = Colors.transparent,
    this.isFullWidth = true,
    this.fontSize,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: AppStyles.paddingL,
          vertical: AppStyles.paddingM,
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? AppStyles.radiusL),
          side: BorderSide(color: borderColor),
        ),
      ),
      child: Text(
        text,
        style: AppStyles.tiket1.copyWith(
          color: textColor,
          fontSize: fontSize ?? AppStyles.tiket1.fontSize,
        ),
      ),
    );

    return isFullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}
