import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class MypageSettingSectionTitle extends StatelessWidget {
  final String title;
  const MypageSettingSectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            title,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
