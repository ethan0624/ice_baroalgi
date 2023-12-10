import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/presentation/widget/app_back_button.dart';

class CourseAppBar extends AppBar {
  final String? text;
  final VoidCallback? onBackPressed;

  CourseAppBar({
    super.key,
    super.elevation = 2,
    this.text,
    this.onBackPressed,
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
              onPressed: () {},
              padding: const EdgeInsets.all(2),
              icon: SvgPicture.asset(
                'assets/images/ic_favorite.svg',
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              padding: const EdgeInsets.all(2),
              icon: SvgPicture.asset(
                'assets/images/ic_share.svg',
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        );
}
