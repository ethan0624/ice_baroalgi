import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_layout.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';

@RoutePage()
class JoinCompleteScreen extends StatefulWidget {
  final String userName;
  const JoinCompleteScreen({super.key, required this.userName});

  @override
  State<JoinCompleteScreen> createState() => _JoinCompleteScreenState();
}

class _JoinCompleteScreenState extends State<JoinCompleteScreen> {
  _showAccountLink() async {}

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _showAccountLink();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BaseLayout(
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          padding: const EdgeInsets.all(defaultMarginValue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 84),
              Text(
                '반갑습니다 님 회원가입이 완료되었습니다'
                    .tr(namedArgs: {'userName': widget.userName}),
                style: context.textTheme.titleSmall,
              ),
              const Spacer(),
              AppButton(
                text: '로그인 하러가기'.tr(),
                textBold: true,
                onPressed: () => context.router.navigateNamed('/login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
