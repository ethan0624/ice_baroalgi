import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';

class RadioBox extends StatelessWidget {
  final bool isChecked;
  const RadioBox({super.key, this.isChecked = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 17,
      height: 17,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: isChecked ? AppColor.primary : Colors.black, width: 2),
      ),
      child: isChecked
          ? Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primary,
              ),
            )
          : null,
    );
  }
}
