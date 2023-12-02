import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';

class SchoolSearchFormField extends StatefulWidget {
  const SchoolSearchFormField({super.key});

  @override
  State<SchoolSearchFormField> createState() => _SchoolSearchFormFieldState();
}

class _SchoolSearchFormFieldState extends State<SchoolSearchFormField> {
  final _textController = TextEditingController();

  _onSearch() async {
    final ret = await context.router.pushNamed('/searchSchool');
    if (ret == null) return;
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: _textController,
      hintText: '학교명 입력',
      readOnly: true,
      onTap: _onSearch,
    );
  }
}
