import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class InfoItemView extends StatelessWidget {
  final String label;
  final String value;
  const InfoItemView({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: Text(
            label,
            style: context.textTheme.labelLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: context.textTheme.labelLarge?.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
