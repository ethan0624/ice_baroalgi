import 'package:flutter/material.dart';
import 'package:incheon_knowhow/presentation/screen/stamp_regist/widget/poll_item_question.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';

class PollItemInputTypeView extends StatelessWidget {
  final int number;
  final String question;
  final String hintText;
  final bool isRequired;
  final String? description;
  const PollItemInputTypeView({
    super.key,
    required this.number,
    required this.question,
    required this.hintText,
    this.isRequired = false,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        children: [
          PollItemQuestion(
            number: number,
            question: question,
            isRequired: isRequired,
            description: description,
          ),
          AppTextFormField(
            hintText: hintText,
          ),
        ],
      ),
    );
  }
}
