import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool textBold;
  final bool centerText;
  final Color? textColor;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final Color? background;
  final Color? borderColor;
  final Widget? suffixIcon;
  final VoidCallback? onPressed;

  const AppButton({
    super.key,
    required this.text,
    this.centerText = true,
    this.textBold = false,
    this.textColor,
    this.width,
    this.height,
    this.margin,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
    this.background,
    this.borderColor,
    this.suffixIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: background ?? AppColor.primary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: 1, color: borderColor ?? (background ?? AppColor.primary)),
        ),
        child: Row(
          mainAxisAlignment: centerText
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: context.textTheme.bodyMedium?.copyWith(
                color: textColor ?? Colors.white,
                fontWeight: textBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (suffixIcon != null) suffixIcon!,
          ],
        ),
      ),
    );
  }
}
