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
  final double? width;
  final double? height;

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
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: AppStyles.paddingL,
              vertical: AppStyles.paddingM,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? AppStyles.radiusXL),
          side: BorderSide(color: borderColor),
        ),
        elevation: 0,
        alignment: Alignment.center,
        minimumSize: Size(
          isFullWidth ? double.infinity : 0,
          height ?? 48,
        ),      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppStyles.tiket1.copyWith(
            color: textColor,
            fontSize: fontSize ?? AppStyles.tiket1.fontSize,
          ),
        ),
      ),
    );

    final wrappedButton = Container(
      padding: containerPadding,
      child: isFullWidth
          ? SizedBox(width: double.infinity, child: button)
          : (width != null || height != null
          ? SizedBox(width: width, height: height, child: button)
          : button),
    );

    return wrappedButton;
  }
}
