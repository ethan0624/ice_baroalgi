import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class Label extends StatelessWidget {
  final String text;
  final Color borderColor;
  const Label({
    super.key,
    required this.text,
    this.borderColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Text(
        text,
        style: context.textTheme.labelMedium,
      ),
    );
  }
}
