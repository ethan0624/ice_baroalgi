import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class OutlineButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final VoidCallback? onPressed;

  const OutlineButton({
    super.key,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
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
          borderRadius: BorderRadius.circular(12),
          border:
              Border.all(color: borderColor ?? AppColor.secondary, width: 1),
        ),
        child: Text(
          text,
          style: context.textTheme.bodySmall?.copyWith(
            color: textColor ?? Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
