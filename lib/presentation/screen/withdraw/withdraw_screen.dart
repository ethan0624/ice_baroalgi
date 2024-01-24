import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/withdraw/bloc/withdraw_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';

@RoutePage()
class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isAgreed = false;

  _onToggleAgreed() {
    setState(() {
      _isAgreed = !_isAgreed;
    });
  }

  _withdrawOnPressed() async {
    if (!_isAgreed) {
      context.showAlert(title: '탈퇴 유의사항'.tr(), message: '탈퇴 유의사항을 체크해주세요'.tr());
      return;
    }

    final ret = await context.showConfirm(
      title: '회원탈퇴'.tr(),
      message: '탈퇴 시 모든 데이터가 삭제되며 복구가 불가능합니다 탈퇴 하시겠습니까'.tr(),
      positiveButtonText: '탈퇴',
    );
    if (ret == null || !ret) return;

    final bloc = _scaffoldKey.currentContext?.read<WithdrawBloc>();
    if (bloc == null) return;

    bloc.add(const WithdrawEvent.withdraw());
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<WithdrawBloc, WithdrawBloc, WithdrawState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(text: '회원탈퇴'.tr()),
      create: (context) => WithdrawBloc(),
      builder: (context, bloc, state) {
        return Stack(
          children: [
            Positioned.fill(
              top: 24,
              left: 24,
              right: 24,
              bottom: 85,
              child: SingleChildScrollView(
                child: Text(
                  '약관'.tr(),
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: _onToggleAgreed,
                        child: Row(
                          children: [
                            AppCheckbox(
                              isChecked: _isAgreed,
                              onCheckChanged: (checked) => _onToggleAgreed(),
                            ),
                            Expanded(
                              child: Text(
                                '탈퇴 유의사항을 모두 숙지하였으며 회원 탈퇴를 신청합니다'.tr(),
                                style: context.textTheme.bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppButton(
                      text: '회원탈퇴'.tr(),
                      background:
                          _isAgreed ? AppColor.primary : AppColor.dividerDark,
                      onPressed: _isAgreed ? _withdrawOnPressed : null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
