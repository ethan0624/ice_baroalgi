import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class TranslateTextView extends StatefulWidget {
  final String text;
  const TranslateTextView({super.key, required this.text});

  @override
  State<TranslateTextView> createState() => _TranslateTextViewState();
}

class _TranslateTextViewState extends State<TranslateTextView> {
  bool _showTranslateText = false;
  String _tanslateText = '';

  _toggleTranslate() {
    // todo: papago translate logic
    setState(() {
      _showTranslateText = !_showTranslateText;
      _tanslateText = widget.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultMarginValue, vertical: 12),
          child: Text(
            _showTranslateText ? _tanslateText : widget.text,
            style: context.textTheme.labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              style: TextButton.styleFrom(
                  minimumSize: const Size(10, 10),
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  splashFactory: NoSplash.splashFactory),
              onPressed: _toggleTranslate,
              child: Text(
                _showTranslateText ? '번역보기'.tr() : '원본보기'.tr(),
                style: context.textTheme.labelLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
