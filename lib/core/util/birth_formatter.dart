import 'package:flutter/services.dart';

class BirthFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final RegExp dateRegex = RegExp(r'^\d{0,4}\/?\d{0,2}\/?\d{0,2}$');
    final String input = newValue.text.replaceAll('/', '');

    if (!dateRegex.hasMatch(input)) {
      // 입력이 유효하지 않은 경우, 이전 값을 유지합니다.
      return oldValue;
    }

    final StringBuffer formatted = StringBuffer();

    for (int i = 0; i < input.length; i++) {
      if (i == 4 || i == 6) {
        formatted.write('/');
      }

      formatted.write(input[i]);
    }

    return TextEditingValue(
      text: formatted.toString(),
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
