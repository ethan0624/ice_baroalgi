import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool textBold;
  final bool centerText;
  final TextStyle? textStyle;
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
    this.textStyle,
    this.width,
    this.height,
    this.margin,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    this.background,
    this.borderColor,
    this.suffixIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: padding,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: background ?? AppColor.primary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 1,
                color: borderColor ?? (background ?? AppColor.primary)),
          ),
          child: Row(
            mainAxisAlignment: centerText
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: textStyle ??
                      context.textTheme.bodyLarge?.copyWith(
                        color: textColor ?? Colors.white,
                        fontWeight:
                            textBold ? FontWeight.bold : FontWeight.normal,
                      ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (suffixIcon != null) suffixIcon!,
            ],
          ),
        ),
      ),
    );
  }
}
