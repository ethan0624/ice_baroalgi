import 'package:flutter/material.dart';

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
              icon: const Icon(Icons.search_outlined),
            ),
            IconButton(
              onPressed: onNotificationPressed,
              icon: const Icon(Icons.notifications_outlined),
            ),
          ],
        );
}
