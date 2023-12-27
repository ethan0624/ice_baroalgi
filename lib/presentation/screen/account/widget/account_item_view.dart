import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class AcountItemView extends StatelessWidget {
  final String label;
  final String value;
  final bool showDivider;
  final VoidCallback? onTap;
  const AcountItemView({
    super.key,
    required this.label,
    required this.value,
    this.showDivider = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: showDivider
              ? Border(
                  bottom: BorderSide(
                    width: 1,
                    color: AppColor.dividerLight,
                  ),
                )
              : null,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                label,
                style: context.textTheme.bodyMedium,
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (onTap != null)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
