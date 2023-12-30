import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/enum/terms_agreement_type.dart';
import 'package:incheon_knowhow/presentation/base/base_layout.dart';
import 'package:incheon_knowhow/presentation/screen/join/join_data.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/checkbox_text.dart';
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

  _onNextPressed() {
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
      appBar: AppSubAppBar(text: '회원가입'),
      child: Padding(
        padding: const EdgeInsets.all(defaultMarginValue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '서비스 이용을 위해\n약관에 동의해주세요.',
              style: context.textTheme.titleSmall,
            ),
            const SizedBox(height: 50),
            CheckBoxText(
              title: '전체선택',
              titleStyle: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ..._agreements.map(
              (e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppCheckbox(),
                  Expanded(
                    child: Text(
                      '${e.title} (${e.isRequired ? '필수' : '선택'})',
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
            const Spacer(),
            AppButton(
              text: '동의하고 진행하기',
              textBold: true,
              onPressed: _onNextPressed,
            ),
          ],
        ),
      ),
    );
  }
}
