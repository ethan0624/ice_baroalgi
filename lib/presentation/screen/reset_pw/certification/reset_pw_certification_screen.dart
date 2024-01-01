import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/model/certification_code.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/reset_pw/certification/bloc/reset_pw_certification_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/icon_text.dart';
import 'package:incheon_knowhow/presentation/widget/underline_text_button.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ResetPwCertificationScreen extends StatefulWidget {
  final CertificationCode certificationCode;
  const ResetPwCertificationScreen({
    super.key,
    required this.certificationCode,
  });

  @override
  State<ResetPwCertificationScreen> createState() =>
      _ResetPwCertificationScreenState();
}

class _ResetPwCertificationScreenState
    extends State<ResetPwCertificationScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _codeTextController = TextEditingController();
  final _maxDuration = const Duration(minutes: 3);
  Duration _remainDuration = const Duration(minutes: 3);
  Timer? timer;

  String get remainTimeFormat {
    return [_remainDuration.inMinutes, _remainDuration.inSeconds]
        .map((e) => e.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  _updateDuration(int tick) {
    setState(() {
      _remainDuration = _maxDuration - Duration(seconds: tick);
      if (_remainDuration == Duration.zero) {
        _stopTimer();
      }
    });
  }

  _startTimer() {
    _stopTimer();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateDuration(timer.tick);
    });
  }

  _stopTimer() {
    timer?.cancel();
    timer = null;
  }

  _onResendPressed() {
    final bloc = _scaffoldKey.currentContext?.read<ResetPwCertificationBloc>();
    if (bloc == null) return;

    bloc.add(const ResetPwCertificationEvent.resend());
  }

  _onCodeSubmit() {
    final code = _codeTextController.text;

    if (code.length < 6) {
      context.showAlert(title: '입력오류', message: '인증번호를 정확하게 입력해주세요');
      return;
    }

    final bloc = _scaffoldKey.currentContext?.read<ResetPwCertificationBloc>();
    if (bloc == null) return;

    bloc.add(ResetPwCertificationEvent.check(code));
  }

  _onNext() {
    context.router.replaceNamed(
        '/resetPw/update?userId=${widget.certificationCode.userId}');
  }

  _handleCodeChanged() {
    final bloc = _scaffoldKey.currentContext?.read<ResetPwCertificationBloc>();
    if (bloc == null) return;

    bloc.add(const ResetPwCertificationEvent.changeCode());
  }

  @override
  void initState() {
    super.initState();

    _codeTextController.addListener(_handleCodeChanged);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _startTimer();
    });
  }

  @override
  void dispose() {
    _codeTextController.removeListener(_handleCodeChanged);
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<ResetPwCertificationBloc,
        ResetPwCertificationBloc, ResetPwCertificationState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(text: '비밀번호 재설정'),
      create: (_) => ResetPwCertificationBloc(
        certificationCode: widget.certificationCode,
      ),
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.all(defaultMarginValue),
          children: [
            const AppTitleText(
              text: '인증번호를 발송했습니다.',
            ),
            const SizedBox(height: 50),
            Text(
              '인증번호',
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            Stack(
              children: [
                AppTextFormField(
                  controller: _codeTextController,
                  hintText: '인증번호 6자리 입력',
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  autoFocus: true,
                  onChange: () {
                    final code = _codeTextController.text;
                    if (code.length == 6) {
                      _onCodeSubmit();
                    }
                  },
                  onSubmitted: _onCodeSubmit,
                ),
                Positioned(
                  right: 10,
                  top: 24,
                  child: Text(
                    remainTimeFormat,
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.isCertificationCodeFail)
                        IconText(
                          icon: SvgPicture.asset(
                            'assets/images/ic_close.svg',
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                                Colors.red, BlendMode.srcIn),
                          ),
                          label: '인증번호가 다릅니다.',
                        ),
                      if (state.isCertificationCodeSuccess)
                        IconText(
                          icon: SvgPicture.asset(
                            'assets/images/ic_checked.svg',
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                                Colors.green, BlendMode.srcIn),
                          ),
                          label: '인증되었습니다!',
                        ),
                    ],
                  ),
                ),
                UnderlineTextButton(
                  text: '인증번호 재발송',
                  margin: EdgeInsets.zero,
                  onPressed: _onResendPressed,
                ),
              ],
            ),
            const SizedBox(height: 78),
            AppButton(
              text: '다음',
              onPressed: state.isCertificationCodeSuccess ? _onNext : null,
              background: state.isCertificationCodeSuccess
                  ? AppColor.primary
                  : Colors.grey,
            ),
          ],
        );
      },
    );
  }
}
