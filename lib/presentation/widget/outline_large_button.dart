import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';

class OutlineLargeButton extends StatelessWidget {
  final Widget child;
  final Color? borderColor;
  final VoidCallback? onPressed;
  const OutlineLargeButton({
    super.key,
    required this.child,
    this.borderColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColor.primary,
        padding: const EdgeInsets.symmetric(vertical: 24),
        side: BorderSide(
          color: borderColor ?? AppColor.secondary,
          width: 2,
          style: BorderStyle.solid,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: child,
    );
  }
}
