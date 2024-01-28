import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/screen/stamp_regist/widget/poll_item_question.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/radio_box.dart';

class PollItemRadioTypeView extends StatelessWidget {
  final int number;
  final String question;
  final bool isRequired;
  final List<String> options;
  final String? description;
  final String? value;
  final ValueChanged<String>? onValueChanged;
  const PollItemRadioTypeView({
    super.key,
    required this.number,
    required this.question,
    required this.options,
    this.isRequired = false,
    this.description,
    this.value,
    this.onValueChanged,
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
            description: description,
          ),
          ...options.map(
            (e) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.dividerLight, width: 1),
              ),
              child: Row(
                children: [
                  RadioBox(isChecked: e == value),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        e,
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.dividerLight, width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const RadioBox(isChecked: false),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 20),
                      child: Text(
                        '기타',
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: AppTextFormField(
                  margin: const EdgeInsets.only(left: 6, bottom: 10),
                  hintText: '작성해주세요',
                  maxLength: 100,
                  textStyle: context.textTheme.bodyMedium,
                  borderColor: AppColor.dividerLight,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
