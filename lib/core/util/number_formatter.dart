import 'package:flutter/services.dart';

class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final RegExp numberRegex = RegExp(r'^[0-9]*$');
    final String input = newValue.text;

    if (!numberRegex.hasMatch(input)) {
      // 입력이 숫자가 아닌 경우, 이전 값을 유지합니다.
      return oldValue;
    }

    return TextEditingValue(
      text: input,
      selection: TextSelection.collapsed(offset: input.length),
    );
  }
}
