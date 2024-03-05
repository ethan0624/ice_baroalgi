import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/usecase/etc/get_translate_text.dart';

class TranslateTextView extends StatefulWidget {
  final String text;
  const TranslateTextView({super.key, required this.text});

  @override
  State<TranslateTextView> createState() => _TranslateTextViewState();
}

class _TranslateTextViewState extends State<TranslateTextView> {
  final _getTranslateText = getIt<GetTranslateText>();
  bool _showTranslateText = false;
  String _tanslateText = '';

  _toggleTranslate() async {
    print('>>>>> _toggleTranslate : $_tanslateText');
    if (_tanslateText.isNotEmpty) {
      setState(() {
        _showTranslateText = !_showTranslateText;
      });
      return;
    }

    final res = await _getTranslateText(
        targetLocale: context.locale.languageCode, text: widget.text);
    print('>>>>> _toggleTranslate res : $res');
    final translateText = res.tryGetSuccess()?.text ?? '';
    if (res.isSuccess() && translateText.isNotEmpty) {
      setState(() {
        _showTranslateText = !_showTranslateText;
        _tanslateText = translateText;
      });
    }
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
                _showTranslateText ? '원본보기'.tr() : '번역보기'.tr(),
                style: context.textTheme.labelLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
