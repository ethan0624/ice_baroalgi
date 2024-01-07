import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/presentation/screen/stamp_regist/widget/poll_item_question.dart';
import 'package:incheon_knowhow/presentation/widget/outline_button.dart';

class PollItemMultipleChoiceTypeView extends StatelessWidget {
  final int number;
  final String question;
  final List<String> options;
  final bool isRequired;
  final String? value;
  const PollItemMultipleChoiceTypeView({
    super.key,
    required this.number,
    required this.question,
    required this.options,
    this.isRequired = false,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PollItemQuestion(
            number: number,
            question: question,
            isRequired: isRequired,
          ),
          Wrap(
            spacing: 8,
            children: options
                .map(
                  (e) => OutlineButton(
                    text: e,
                    textColor: AppTextColor.medium,
                    borderRadius: 30,
                    borderColor: AppColor.dividerMedium,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
