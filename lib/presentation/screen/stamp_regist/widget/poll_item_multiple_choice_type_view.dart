import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/presentation/screen/stamp_regist/widget/poll_item_question.dart';
import 'package:incheon_knowhow/presentation/widget/outline_button.dart';

class PollItemMultipleChoiceTypeView extends StatefulWidget {
  final int number;
  final String question;
  final List<String> options;
  final bool isRequired;
  final String? value;
  final ValueChanged<String>? onValueChanged;
  const PollItemMultipleChoiceTypeView({
    super.key,
    required this.number,
    required this.question,
    required this.options,
    this.isRequired = false,
    this.value,
    this.onValueChanged,
  });

  @override
  State<PollItemMultipleChoiceTypeView> createState() =>
      _PollItemMultipleChoiceTypeViewState();
}

class _PollItemMultipleChoiceTypeViewState
    extends State<PollItemMultipleChoiceTypeView> {
  final List<String> _answers = [];

  _onChoice(String value) {
    setState(() {
      if (_answers.contains(value)) {
        _answers.remove(value);
      } else {
        _answers.add(value);
      }
    });

    final items = _answers.toSet().toList().join(',');
    widget.onValueChanged?.call(items);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PollItemQuestion(
            number: widget.number,
            question: widget.question,
            isRequired: widget.isRequired,
          ),
          Wrap(
            spacing: 8,
            children: widget.options
                .map(
                  (e) => OutlineButton(
                    text: e,
                    textColor: AppTextColor.medium,
                    borderRadius: 30,
                    borderColor: _answers.contains(e)
                        ? AppColor.primary
                        : AppColor.dividerMedium,
                    onPressed: () => _onChoice(e),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
