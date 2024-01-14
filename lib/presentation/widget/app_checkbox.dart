import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool>? onCheckChanged;
  const AppCheckbox({super.key, this.isChecked = false, this.onCheckChanged});

  @override
  Widget build(BuildContext context) {
    // todo : custom check box
    return Checkbox(
      value: isChecked,
      side: MaterialStateBorderSide.resolveWith(
        (states) => const BorderSide(width: 2, color: Colors.black),
      ),
      activeColor: Colors.transparent,
      checkColor: Colors.black,
      onChanged: (checked) => onCheckChanged?.call(checked ?? false),
    );
  }
}
