import 'package:flutter/material.dart';
import 'package:incheon_knowhow/presentation/screen/stamp_regist/widget/poll_item_question.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';

class PollItemInputTypeView extends StatefulWidget {
  final int number;
  final String question;
  final String hintText;
  final bool isRequired;
  final String? description;
  final ValueChanged<String>? onTextChanged;
  const PollItemInputTypeView({
    super.key,
    required this.number,
    required this.question,
    required this.hintText,
    this.isRequired = false,
    this.description,
    this.onTextChanged,
  });

  @override
  State<PollItemInputTypeView> createState() => _PollItemInputTypeViewState();
}

class _PollItemInputTypeViewState extends State<PollItemInputTypeView> {
  final _textController = TextEditingController();

  _onTextChanged() {
    widget.onTextChanged?.call(_textController.text);
  }

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
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
            description: widget.description,
          ),
          AppTextFormField(
            controller: _textController,
            hintText: widget.hintText,
          ),
        ],
      ),
    );
  }
}
