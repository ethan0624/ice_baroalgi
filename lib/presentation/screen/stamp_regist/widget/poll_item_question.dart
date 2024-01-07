import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class PollItemQuestion extends StatelessWidget {
  final int number;
  final String question;
  final bool isRequired;
  final String? description;

  const PollItemQuestion({
    super.key,
    required this.number,
    required this.question,
    this.isRequired = false,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              number.toString().padLeft(2, '0'),
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  '$question ${isRequired ? '' : ' (선택)'}',
                  style: context.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (description != null)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.dividerLight,
            ),
            child: Text(
              description ?? '',
              style: context.textTheme.bodyMedium,
            ),
          ),
      ],
    );
  }
}
