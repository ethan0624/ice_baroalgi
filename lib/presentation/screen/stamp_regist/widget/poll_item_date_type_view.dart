import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/presentation/screen/stamp_regist/widget/poll_item_question.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';

class PollItemDateTypeView extends StatefulWidget {
  final int number;
  final String question;
  final String hintText;
  final bool isRequired;
  final String value;
  final ValueChanged<String>? onTextChanged;
  const PollItemDateTypeView({
    super.key,
    required this.number,
    required this.question,
    required this.hintText,
    required this.isRequired,
    this.value = '',
    this.onTextChanged,
  });

  @override
  State<PollItemDateTypeView> createState() => _PollItemDateTypeViewState();
}

class _PollItemDateTypeViewState extends State<PollItemDateTypeView> {
  final _yearTextController = TextEditingController();
  final _monthTextController = TextEditingController();

  _onValueChanged() {
    final year = _yearTextController.text;
    final month = _monthTextController.text;
    if (year.isEmpty || month.isEmpty) {
      widget.onTextChanged?.call('');
    } else {
      widget.onTextChanged?.call('$year,$month');
    }
  }

  @override
  void initState() {
    super.initState();

    _yearTextController.addListener(_onValueChanged);
    _monthTextController.addListener(_onValueChanged);

    final now = DateTime.now();
    if (widget.value.isEmpty) {
      _yearTextController.text = now.year.toString();
      _monthTextController.text = now.month.toString();
    } else {
      final temp = widget.value.split(',');
      _yearTextController.text = temp[0] ?? now.year.toString();
      _monthTextController.text = temp[1] ?? now.month.toString();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onValueChanged();
    });
  }

  @override
  void dispose() {
    _yearTextController.removeListener(_onValueChanged);
    _monthTextController.removeListener(_onValueChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        children: [
          PollItemQuestion(
            number: widget.number,
            question: widget.question,
            isRequired: widget.isRequired,
          ),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  controller: _yearTextController,
                  hintText: '년도'.tr(),
                  textAlign: TextAlign.end,
                  readOnly: true,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: AppTextFormField(
                  controller: _monthTextController,
                  hintText: '월'.tr(),
                  textAlign: TextAlign.end,
                  readOnly: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
