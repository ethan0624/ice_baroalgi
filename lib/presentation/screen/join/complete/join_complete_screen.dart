import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
    return WillPopScope(
      onWillPop: () => Future(() => false),
      child: BaseLayout(
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          padding: const EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 56),
              Text(
                '반갑습니다, ${widget.userName} 님\n회원가입이 완료되었습니다.',
                style: context.textTheme.titleSmall,
              ),
              const Spacer(),
              AppButton(
                text: '로그인 하러가기',
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
