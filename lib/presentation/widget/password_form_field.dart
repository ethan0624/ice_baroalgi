import 'package:flutter/material.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/icon_text.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final EdgeInsets margin;
  const PasswordFormField({
    super.key,
    this.controller,
    this.hint,
    this.margin = const EdgeInsets.symmetric(vertical: 14),
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            controller: widget.controller,
            hintText: widget.hint ?? '비밀번호 입력',
            margin: EdgeInsets.zero,
            isObscureText: true,
          ),
          const SizedBox(height: 6),
          const Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              IconText(
                icon: Icon(
                  Icons.close_rounded,
                  size: 22,
                  color: Colors.red,
                ),
                label: '영문포함',
              ),
              IconText(
                icon: Icon(
                  Icons.close_rounded,
                  size: 22,
                  color: Colors.red,
                ),
                label: '숫자포함',
              ),
              IconText(
                icon: Icon(
                  Icons.close_rounded,
                  size: 22,
                  color: Colors.red,
                ),
                label: '8자 이상',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
