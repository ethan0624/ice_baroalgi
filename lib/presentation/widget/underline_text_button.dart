import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class UnderlineTextButton extends StatelessWidget {
  final String text;
  final EdgeInsets margin;
  final VoidCallback? onPressed;
  const UnderlineTextButton({
    super.key,
    required this.text,
    this.margin = const EdgeInsets.symmetric(vertical: 12),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: AppTextColor.light),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: const Size(10, 10),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          text,
          style: context.textTheme.labelLarge?.copyWith(
            color: AppTextColor.dark,
          ),
        ),
      ),
    );
  }
}
