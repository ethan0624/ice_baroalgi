import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Color? textColor;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final VoidCallback? onPressed;

  const FilterButton({
    super.key,
    required this.text,
    this.isSelected = false,
    this.textColor,
    this.backgroundColor,
    this.margin,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: isSelected ? AppColor.primary : AppColor.dividerDark,
              width: 1),
        ),
        child: Center(
          child: Text(
            text,
            style: context.textTheme.labelLarge?.copyWith(
              color: textColor ?? Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              height: 1.25,
            ),
          ),
        ),
      ),
    );
  }
}
