import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/enum/user_gender_type.dart';
import 'package:incheon_knowhow/presentation/base/base_layout.dart';
import 'package:incheon_knowhow/presentation/screen/certification/certification_result.dart';
import 'package:incheon_knowhow/presentation/screen/join/join_data.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/verfication_button.dart';
import 'package:incheon_knowhow/route/app_router.dart';

@RoutePage()
class JoinCertificationScreen extends StatefulWidget {
  final JoinData joinData;
  const JoinCertificationScreen({super.key, required this.joinData});

  @override
  State<JoinCertificationScreen> createState() =>
      _JoinCertificationScreenState();
}

class _JoinCertificationScreenState extends State<JoinCertificationScreen> {
  _onCertificationPressed() async {
    context.router
        .pushNamed<CertificationResult>('/certification')
        .then((value) {
      if (value == null) return;

      final updateJoinData = widget.joinData.copyWith(
        userCI: value.ci,
        userName: value.name,
        userBirthday: value.birthDay,
        userGender: value.gender == CertificationResultGender.male
            ? UserGenderType.male
            : UserGenderType.female,
        userPhoneNumber: value.phoneNumber,
      );

      context.router.push(JoinRegistRoute(joinData: updateJoinData));
    });
  }

  _onParentCertificationPressed() async {
    context.router.push(JoinUserInfoRoute(joinData: widget.joinData));
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBar: AppSubAppBar(text: '회원가입'.tr()),
      child: ListView(
        padding: const EdgeInsets.all(defaultMarginValue),
        children: [
          Text(
            '본인인증을 진행해주세요'.tr(),
            style: context.textTheme.titleSmall,
          ),
          const SizedBox(height: 4),
          Text(
            '본인 휴대폰이 없는 경우 보호자 휴대폰으로 인증하세요'.tr(),
            style: context.textTheme.bodySmall,
          ),
          const SizedBox(height: defaultMarginValue),
          VerificationButton(
            label: '휴대폰 인증하기'.tr(),
            iconPath: 'assets/images/img_phone_on.png',
            onPressed: _onCertificationPressed,
          ),
          const SizedBox(height: 12),
          VerificationButton(
            label: '보호자 휴대폰 인증하기'.tr(),
            iconPath: 'assets/images/img_person_on.png',
            onPressed: _onParentCertificationPressed,
          ),
        ],
      ),
    );
  }
}
