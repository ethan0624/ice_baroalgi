import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/presentation/widget/app_back_button.dart';

class AppSubAppBar extends AppBar {
  final String? text;
  final double? elevation;
  final VoidCallback? onBackPressed;

  AppSubAppBar({
    super.key,
    super.actions,
    this.text,
    this.elevation = 2,
    this.onBackPressed,
  }) : super(
          title: Text(
            text ?? '',
            style: AppTheme.defaultTextTheme.bodyLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: AppBackButton(onBackPressed: onBackPressed),
          elevation: elevation,
        );
}