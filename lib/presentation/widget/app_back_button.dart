import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onBackPressed;
  const AppBackButton({
    super.key,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onBackPressed ??
          () {
            context.router.pop();
          },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }
}
