import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/business/bloc/business_bloc.dart';
import 'package:incheon_knowhow/presentation/screen/business/widget/business_item_view.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';

@RoutePage()
class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<BusinessBloc, BusinessBloc, BusinessState>(
      appBar: AppSubAppBar(text: '사업자정보'),
      create: (context) => BusinessBloc()..add(const BusinessEvent.initial()),
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
          children: [
            BusinessItemView(
              label: '상호명',
              value: state.businessInfo?.businessName ?? '',
            ),
            BusinessItemView(
              label: '대표',
              value: state.businessInfo?.ceoName ?? '',
            ),
            BusinessItemView(
              label: '사업자등록번호',
              value: state.businessInfo?.businessNumber ?? '',
            ),
            BusinessItemView(
              label: '주소',
              value: state.businessInfo?.address ?? '',
            ),
            BusinessItemView(
              label: '개인정보담당자',
              value: state.businessInfo?.privacyInfoManager ?? '',
            ),
            BusinessItemView(
              label: '이메일',
              value: state.businessInfo?.email ?? '',
            ),
            BusinessItemView(
              label: '고객선터',
              value: state.businessInfo?.customerCenterPhoneNumber ?? '',
            ),
          ],
        );
      },
    );
  }
}
