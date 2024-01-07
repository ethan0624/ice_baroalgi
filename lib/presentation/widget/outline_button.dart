import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class OutlineButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final VoidCallback? onPressed;

  const OutlineButton({
    super.key,
    required this.text,
    this.textColor,
    this.textStyle,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1,
    this.borderRadius = 12,
    this.margin,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
              color: borderColor ?? AppColor.secondary, width: borderWidth),
        ),
        child: Text(
          text,
          style: textStyle ??
              context.textTheme.bodySmall?.copyWith(
                color: textColor ?? Colors.black,
                fontWeight: FontWeight.normal,
              ),
        ),
      ),
    );
  }
}
