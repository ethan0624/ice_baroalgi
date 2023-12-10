import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends AppBar {
  final VoidCallback? onSearchPressed;
  final VoidCallback? onNotificationPressed;
  HomeAppBar({
    super.key,
    this.onSearchPressed,
    this.onNotificationPressed,
  }) : super(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset('assets/images/app_logo_text.png'),
          ),
          leadingWidth: 185,
          actions: [
            IconButton(
              onPressed: onSearchPressed,
              icon: SvgPicture.asset(
                'assets/images/ic_search.svg',
                width: 25,
                height: 25,
              ),
            ),
            IconButton(
              onPressed: onNotificationPressed,
              icon: SvgPicture.asset(
                'assets/images/ic_notification.svg',
                width: 25,
                height: 25,
              ),
            ),
          ],
        );
}
