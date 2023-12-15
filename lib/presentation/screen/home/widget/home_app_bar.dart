import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incheon_knowhow/config/app_theme.dart';

class HomeAppBar extends AppBar {
  final VoidCallback? onSearchPressed;
  final VoidCallback? onNotificationPressed;
  HomeAppBar({
    super.key,
    this.onSearchPressed,
    this.onNotificationPressed,
  }) : super(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
            child: Image.asset('assets/images/app_logo_text.png'),
          ),
          leadingWidth: 185,
          actions: [
            IconButton(
              onPressed: onSearchPressed,
              icon: SvgPicture.asset(
                'assets/images/ic_search.svg',
                width: 28,
                height: 28,
              ),
            ),
            IconButton(
              onPressed: onNotificationPressed,
              icon: SvgPicture.asset(
                'assets/images/ic_notification.svg',
                width: 28,
                height: 28,
              ),
            ),
          ],
        );
}
