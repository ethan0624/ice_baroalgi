import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/util/number_formatter.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';
import 'package:incheon_knowhow/presentation/screen/update_school/bloc/update_school_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/school_search_form_field.dart';
import 'package:provider/provider.dart';

@RoutePage<bool>()
class UpdateSchoolScreen extends StatefulWidget {
  const UpdateSchoolScreen({super.key});

  @override
  State<UpdateSchoolScreen> createState() => _UpdateSchoolScreenState();
}

class _UpdateSchoolScreenState extends State<UpdateSchoolScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _schoolNameTextController = TextEditingController();
  final _schoolGradeTextController = TextEditingController();
  final _schoolClassTextController = TextEditingController();

  _onSavePressed() {
    if (_schoolNameTextController.text.isEmpty) {
      context.showAlert(title: '학교명 입력', message: '학교명을 입력해주세요');
      return;
    }

    if (_schoolGradeTextController.text.isEmpty) {
      context.showAlert(title: '학년 입력', message: '학년을 입력해주세요');
      return;
    }

    if (_schoolClassTextController.text.isEmpty) {
      context.showAlert(title: '반 입력', message: '반을 입력해주세요');
      return;
    }

    final bloc = _scaffoldKey.currentContext?.read<UpdateSchoolBloc>();
    if (bloc == null) return;

    bloc.add(UpdateSchoolEvent.save(
      schoolName: _schoolNameTextController.text,
      schoolGrade: int.parse(_schoolGradeTextController.text),
      schoolClass: int.parse(_schoolClassTextController.text),
    ));
  }

  @override
  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<UpdateSchoolBloc, UpdateSchoolBloc,
        UpdateSchoolState>(
      appBar: AppSubAppBar(text: '학교정보수정'),
      scaffoldKey: _scaffoldKey,
      create: (context) => UpdateSchoolBloc(),
      effectChanged: (context, effect) {
        if (effect is SuccessEffect) {
          context.router.pop(true);
        }
      },
      builder: (context, bloc, state) {
        return Stack(
          children: [
            Positioned.fill(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 26),
                children: [
                  const AppTitleText(text: '학교정보를 입력해 주세요.'),
                  const SizedBox(height: 50),
                  Text(
                    '학교',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SchoolSearchFormField(
                    controller: _schoolNameTextController,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextFormField(
                          controller: _schoolGradeTextController,
                          hintText: '학년 입력',
                          margin: EdgeInsets.zero,
                          keyboardType: TextInputType.number,
                          inputFormatters: [NumberFormatter()],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AppTextFormField(
                          controller: _schoolClassTextController,
                          hintText: '반 입력',
                          margin: EdgeInsets.zero,
                          keyboardType: TextInputType.number,
                          inputFormatters: [NumberFormatter()],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 26,
              left: 26,
              right: 26,
              child: AppButton(
                text: '수정',
                onPressed: _onSavePressed,
              ),
            ),
          ],
        );
      },
    );
  }
}
