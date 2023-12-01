import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class IconText extends StatelessWidget {
  final Widget icon;
  final String label;
  const IconText({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        icon,
        Text(
          label,
          style: context.textTheme.labelLarge,
        ),
      ],
    );
  }
}
