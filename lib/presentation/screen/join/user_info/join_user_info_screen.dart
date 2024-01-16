import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/util/birth_formatter.dart';
import 'package:incheon_knowhow/core/util/number_formatter.dart';
import 'package:incheon_knowhow/domain/enum/user_gender_type.dart';
import 'package:incheon_knowhow/presentation/base/base_layout.dart';
import 'package:incheon_knowhow/presentation/screen/certification/certification_result.dart';
import 'package:incheon_knowhow/presentation/screen/join/join_data.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/radio_box.dart';
import 'package:incheon_knowhow/route/app_router.dart';

@RoutePage()
class JoinUserInfoScreen extends StatefulWidget {
  final JoinData joinData;
  const JoinUserInfoScreen({super.key, required this.joinData});

  @override
  State<JoinUserInfoScreen> createState() => _JoinUserInfoScreenState();
}

class _JoinUserInfoScreenState extends State<JoinUserInfoScreen> {
  final _nameTextController = TextEditingController();
  final _birthTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _nameFocus = FocusNode();
  final _birthFocus = FocusNode();
  final _phoneFocus = FocusNode();

  UserGenderType _genderType = UserGenderType.male;

  _onGenderChanged(UserGenderType genderType) {
    setState(() {
      _genderType = genderType;
    });
  }

  _onCertificationPressed() async {
    final name = _nameTextController.text;
    final birth = _birthTextController.text;
    final phone = _phoneTextController.text;

    if (name.isEmpty) {
      await context.showAlert(title: '입력오류'.tr(), message: '이름을 입력해주세요'.tr());
      _nameFocus.requestFocus();
      return;
    }

    if (birth.isEmpty) {
      await context.showAlert(title: '입력오류'.tr(), message: '생년월일을 입력해주세요'.tr());
      _birthFocus.requestFocus();
      return;
    }

    if (phone.isEmpty) {
      await context.showAlert(
          title: '입력오류'.tr(), message: '휴대폰번호를 입력해주세요'.tr());
      _phoneFocus.requestFocus();
      return;
    }

    context.router
        .pushNamed<CertificationResult>('/certification')
        .then((value) {
      if (value == null) return;

      final updateJoinData = widget.joinData.copyWith(
        userName: _nameTextController.text,
        userBirthday: _birthTextController.text.replaceAll('/', '-'),
        userPhoneNumber: _phoneTextController.text,
        userGender: _genderType,
        parentCI: value.ci,
        parentName: value.name,
        parentBirthday: value.birthDay,
        parentGender: value.gender == CertificationResultGender.male
            ? UserGenderType.male
            : UserGenderType.female,
        parentPhoneNumber: value.phoneNumber,
      );

      context.router.push(JoinRegistRoute(joinData: updateJoinData));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBar: AppSubAppBar(text: '회원가입'.tr()),
      child: ListView(
        padding: const EdgeInsets.all(defaultMarginValue),
        children: [
          Text(
            '보호자 휴대폰으로 인증하기'.tr(),
            style: context.textTheme.titleSmall,
          ),
          const SizedBox(height: 5),
          Text(
            '* 가입자 정보를 입력해주세요.'.tr(),
            style: context.textTheme.bodySmall,
          ),
          const SizedBox(height: 50),
          Text(
            '이름'.tr(),
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          AppTextFormField(
            controller: _nameTextController,
            focusNode: _nameFocus,
            hintText: '이름을 입력하세요'.tr(),
          ),
          const SizedBox(height: defaultMarginValue),
          Text(
            '생년월일'.tr(),
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          AppTextFormField(
            controller: _birthTextController,
            focusNode: _birthFocus,
            hintText: 'YYYY / MM / DD',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            inputFormatters: [BirthFormatter()],
          ),
          const SizedBox(height: defaultMarginValue),
          Text(
            '성별'.tr(),
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: defaultMarginValue / 2),
          Wrap(
            spacing: 12,
            children: [
              ...UserGenderType.values.map(
                (e) => InkWell(
                  onTap: () => _onGenderChanged(e),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1,
                          color: e == _genderType
                              ? AppColor.primary
                              : AppColor.dividerDark),
                      color: e == _genderType
                          ? AppColor.secondary.withOpacity(0.2)
                          : null,
                    ),
                    child: Wrap(
                      spacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        RadioBox(
                          isChecked: e == _genderType,
                        ),
                        Text(e.title),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultMarginValue),
          Text(
            '휴대폰 번호'.tr(),
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          AppTextFormField(
            controller: _phoneTextController,
            focusNode: _phoneFocus,
            hintText: '가입자의 휴대폰 번호를 입력하세요'.tr(),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            inputFormatters: [NumberFormatter()],
          ),
          const SizedBox(height: defaultMarginValue),
          Text(
            '보호자 인증'.tr(),
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          AppButton(
            margin: const EdgeInsets.symmetric(vertical: 12),
            text: '보호자 휴대폰 인증하기'.tr(),
            textBold: true,
            onPressed: _onCertificationPressed,
          ),
        ],
      ),
    );
  }
}
