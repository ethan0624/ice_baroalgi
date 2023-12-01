import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';

class CheckBoxText extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final ValueChanged<bool>? onChanged;
  const CheckBoxText({
    super.key,
    required this.title,
    this.titleStyle,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const AppCheckbox(),
        Text(
          title,
          style: titleStyle ??
              context.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
