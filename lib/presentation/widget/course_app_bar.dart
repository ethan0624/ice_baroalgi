import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/presentation/widget/app_back_button.dart';

class CourseAppBar extends AppBar {
  final String? text;
  final bool isFavorited;
  final VoidCallback? onBackPressed;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onSharedPressed;

  CourseAppBar({
    super.key,
    super.elevation = 3,
    this.text,
    this.isFavorited = false,
    this.onBackPressed,
    this.onFavoritePressed,
    this.onSharedPressed,
  }) : super(
          title: Text(
            text ?? '',
            style: AppTheme.defaultTextTheme.bodyLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: false,
          automaticallyImplyLeading: true,
          leading: AppBackButton(onBackPressed: onBackPressed),
          actions: [
            IconButton(
              onPressed: onFavoritePressed,
              padding: const EdgeInsets.all(2),
              icon: Icon(
                isFavorited ? Icons.favorite : Icons.favorite_outline,
                color: isFavorited ? AppColor.primary : Colors.black,
              ),
            ),
            IconButton(
              onPressed: onSharedPressed,
              padding: const EdgeInsets.all(2),
              icon: SvgPicture.asset(
                'assets/images/ic_share.svg',
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
                width: 46,
              ),
            ),
          ],
        );
}
