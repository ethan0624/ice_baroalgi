import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/util/number_formatter.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/update_phone/bloc/update_phone_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';

@RoutePage()
class UpdatePhoneScreen extends StatefulWidget {
  const UpdatePhoneScreen({super.key});

  @override
  State<UpdatePhoneScreen> createState() => _UpdatePhoneScreenState();
}

class _UpdatePhoneScreenState extends State<UpdatePhoneScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _phoneTextController = TextEditingController();

  _onUpdatePressed() async {}

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<UpdatePhoneBloc, UpdatePhoneBloc,
        UpdatePhoneState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(text: '휴대폰번호변경'.tr()),
      create: (context) => UpdatePhoneBloc(),
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.all(defaultMarginValue),
          children: [
            AppTitleText(
              text: '휴대폰 번호를 입력해주세요'.tr(),
            ),
            const SizedBox(height: 50),
            Text(
              '휴대폰번호'.tr(),
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            AppTextFormField(
              controller: _phoneTextController,
              hintText: '휴대폰 번호를 입력하세요'.tr(),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              inputFormatters: [NumberFormatter()],
            ),
            const SizedBox(height: defaultMarginValue),
            AppButton(
              text: '변경완료'.tr(),
              // onPressed: _onUpdatePressed,
            ),
          ],
        );
      },
    );
  }
}
