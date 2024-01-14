import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/domain/model/school.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';

class SchoolSearchFormField extends StatefulWidget {
  final TextEditingController controller;
  const SchoolSearchFormField({
    super.key,
    required this.controller,
  });

  @override
  State<SchoolSearchFormField> createState() => _SchoolSearchFormFieldState();
}

class _SchoolSearchFormFieldState extends State<SchoolSearchFormField> {
  _onSearch() async {
    final ret = await context.router.pushNamed<School>('/searchSchool');
    if (ret == null) return;

    widget.controller.text = ret.name;
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.controller,
      hintText: '학교명 입력'.tr(),
      readOnly: true,
      onTap: _onSearch,
    );
  }
}
