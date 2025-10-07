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
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? containerPadding;

  const ReuseButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppStyles.primary2,
    this.textColor = AppStyles.light,
    this.borderColor = Colors.transparent,
    this.isFullWidth = true,
    this.fontSize,
    this.radius,
    this.contentPadding,
    this.containerPadding,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: contentPadding ?? EdgeInsets.symmetric(
          horizontal: AppStyles.paddingL,
          vertical: AppStyles.paddingM,
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? AppStyles.radiusXL),
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

    final wrappedButton = Container(
      padding: containerPadding,
      child: isFullWidth
          ? SizedBox(width: double.infinity, child: button)
          : button,
    );

    return wrappedButton;
  }
}
