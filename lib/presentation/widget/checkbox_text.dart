import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';

class CheckBoxText extends StatelessWidget {
  final bool isChecked;
  final String title;
  final TextStyle? titleStyle;
  final ValueChanged<bool>? onChanged;
  const CheckBoxText({
    super.key,
    required this.isChecked,
    required this.title,
    this.titleStyle,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged?.call(!isChecked),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          AppCheckbox(isChecked: isChecked),
          Text(
            title,
            style: titleStyle ??
                context.textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
