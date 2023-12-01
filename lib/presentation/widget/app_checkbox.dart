import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    // todo : custom check box
    return Checkbox(
      value: true,
      side: MaterialStateBorderSide.resolveWith(
        (states) => const BorderSide(width: 2, color: Colors.black),
      ),
      activeColor: Colors.transparent,
      checkColor: Colors.black,
      onChanged: (isChecked) {},
    );
  }
}
