import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/enum/user_type.dart';
import 'package:incheon_knowhow/presentation/base/base_layout.dart';
import 'package:incheon_knowhow/presentation/screen/join/join_data.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/outline_large_button.dart';
import 'package:incheon_knowhow/route/app_router.dart';

@RoutePage()
class JoinUserTypeScreen extends StatefulWidget {
  const JoinUserTypeScreen({super.key});

  @override
  State<JoinUserTypeScreen> createState() => _JoinUserTypeScreenState();
}

class _JoinUserTypeScreenState extends State<JoinUserTypeScreen> {
  _onUserTypePressed({
    required UserType type,
    required bool isFourteenOver,
  }) {
    context.router.push(
      JoinAgreementRoute(
        joinData: JoinData(
          type: type,
          isFourteenOver: isFourteenOver,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBar: AppSubAppBar(text: '회원가입'),
      child: ListView(
        padding: const EdgeInsets.all(defaultMarginValue),
        children: [
          Text(
            '회원유형을 선택해주세요.',
            style: context.textTheme.titleSmall,
          ),
          const SizedBox(height: 62),
          Text(
            '학생',
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlineLargeButton(
                  onPressed: () => _onUserTypePressed(
                      type: UserType.student, isFourteenOver: false),
                  child: Center(
                    child: Text(
                      '14세 미만\n가입하기',
                      style: context.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlineLargeButton(
                  onPressed: () => _onUserTypePressed(
                      type: UserType.student, isFourteenOver: true),
                  borderColor: AppColor.primary,
                  child: Text(
                    '14세 이상\n가입하기',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 26),
          Text(
            '일반',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppTextColor.dark,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '* 학교 밖 청소년',
            style: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppTextColor.dark,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlineLargeButton(
                  onPressed: () => _onUserTypePressed(
                      type: UserType.other, isFourteenOver: false),
                  child: Text(
                    '14세 미만\n가입하기',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlineLargeButton(
                  onPressed: () => _onUserTypePressed(
                      type: UserType.other, isFourteenOver: true),
                  borderColor: AppColor.primary,
                  child: Text(
                    '14세 이상\n가입하기',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
