import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/enum/terms_agreement_type.dart';
import 'package:incheon_knowhow/presentation/base/base_layout.dart';
import 'package:incheon_knowhow/presentation/screen/join/join_data.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/route/app_router.dart';

@RoutePage()
class JoinAgreementScreen extends StatefulWidget {
  final JoinData joinData;
  const JoinAgreementScreen({super.key, required this.joinData});

  @override
  State<JoinAgreementScreen> createState() => _JoinAgreementScreenState();
}

class _JoinAgreementScreenState extends State<JoinAgreementScreen> {
  List<TermsAgreementType> _agreements = [];
  final _checkedAgreementMap = <TermsAgreementType, bool>{};

  bool get _isAllAgreed {
    return _agreements
        .every((agreement) => _checkedAgreementMap[agreement] == true);
  }

  bool get _isRequiredAgreed => _agreements
      .where((a) => a.isRequired)
      .every((a) => _checkedAgreementMap[a] == true);

  _onAllAgreements() {
    setState(() {
      final checked = !_isAllAgreed;
      for (final agreement in _agreements) {
        _checkedAgreementMap[agreement] = checked;
      }
    });
  }

  _onToggleTermsAgreement(TermsAgreementType agreement) {
    setState(() {
      _checkedAgreementMap[agreement] =
          !(_checkedAgreementMap[agreement] ?? false);
    });
  }

  _onNextPressed() {
    if (!_isRequiredAgreed) {
      context.showAlert(title: '약관에 동의해주세요');
      return;
    }

    if (widget.joinData.isFourteenOver) {
      context.router.push(JoinCertificationRoute(joinData: widget.joinData));
    } else {
      context.router.push(JoinUserInfoRoute(joinData: widget.joinData));
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _agreements = widget.joinData.isFourteenOver
            ? TermsAgreementType.values
                .where((e) => e != TermsAgreementType.legalRepresentative)
                .toList()
            : TermsAgreementType.values;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBar: AppSubAppBar(text: '회원가입'.tr()),
      child: Padding(
        padding: const EdgeInsets.all(defaultMarginValue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '서비스 이용을 위해 약관에 동의해주세요'.tr(),
              style: context.textTheme.titleSmall,
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: _onAllAgreements,
              child: Row(
                children: [
                  AppCheckbox(isChecked: _isAllAgreed),
                  Text(
                    '전체선택'.tr(),
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(),
            ..._agreements.map(
              (e) => InkWell(
                onTap: () => _onToggleTermsAgreement(e),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppCheckbox(
                      isChecked: _checkedAgreementMap[e] == true,
                      onCheckChanged: (value) {
                        _onToggleTermsAgreement(e);
                      },
                    ),
                    Expanded(
                      child: Text(
                        '${e.title} (${e.isRequired ? '필수'.tr() : '선택'.tr()})',
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            AppButton(
              text: '동의하고 진행하기'.tr(),
              textBold: true,
              background: _isRequiredAgreed ? AppColor.primary : Colors.grey,
              onPressed: _isRequiredAgreed ? _onNextPressed : null,
            ),
          ],
        ),
      ),
    );
  }
}
