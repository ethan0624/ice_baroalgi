import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';

class MyCourseAppBar extends AppBar {
  final VoidCallback? onFavoritePressed;
  MyCourseAppBar({
    super.key,
    this.onFavoritePressed,
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
              onPressed: onFavoritePressed,
              icon: const Icon(
                Icons.favorite_outline,
                color: Colors.black,
              ),
            ),
          ],
        );
}
