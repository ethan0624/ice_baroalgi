import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/presentation/widget/app_back_button.dart';

class AppSubAppBar extends AppBar {
  final String? text;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  AppSubAppBar({
    super.key,
    super.actions,
    super.elevation = 3,
    super.centerTitle = true,
    this.showBackButton = true,
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
          automaticallyImplyLeading: true,
          leading: showBackButton
              ? AppBackButton(onBackPressed: onBackPressed)
              : Container(),
          surfaceTintColor: Colors.transparent,
        );
}
