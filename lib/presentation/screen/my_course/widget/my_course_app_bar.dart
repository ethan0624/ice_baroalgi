import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';

class MyCourseAppBar extends AppBar {
  final VoidCallback? onFarivotePressed;
  MyCourseAppBar({
    super.key,
    this.onFarivotePressed,
  }) : super(
          leading: Center(
            child: Text(
              '나의코스',
              style: AppTheme.defaultTextTheme.bodyLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          leadingWidth: 120,
          actions: [
            IconButton(
              onPressed: onFarivotePressed,
              icon: const Icon(
                Icons.favorite_outline,
                color: Colors.black,
              ),
            ),
          ],
        );
}
