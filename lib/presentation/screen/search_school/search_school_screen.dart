import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/search_school/bloc/search_school_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';

@RoutePage()
class SearchSchoolScreen extends StatefulWidget {
  const SearchSchoolScreen({super.key});

  @override
  State<SearchSchoolScreen> createState() => _SearchSchoolScreenState();
}

class _SearchSchoolScreenState extends State<SearchSchoolScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<SearchSchoolBloc, SearchSchoolBloc,
        SearchSchoolState>(
      appBar: AppSubAppBar(text: '학교검색', elevation: 0),
      backgroundColor: Colors.white,
      create: (_) => SearchSchoolBloc(),
      builder: (context, bloc, state) {
        return Column(
          children: [
            Container(
              color: AppColor.background,
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultMarginValue,
                  vertical: defaultMarginValue / 2),
              child: Text(
                '학교 분류 또는 학교명 클릭 시 선택된 학교가 자동으로 입력됩니다.\n\n검색한 학교가 없을 경우 학생 회원으로 가입하실 수 없습니다.\n일반 회원으로 가입을 진행하시기 바랍니다.',
                style: context.textTheme.labelMedium,
              ),
            ),
            const AppTextFormField(
              margin: EdgeInsets.symmetric(
                  horizontal: defaultMarginValue,
                  vertical: defaultMarginValue / 2),
              hintText: '학교명을 검색하세요',
              suffix: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            Container(
              height: 5,
              color: AppColor.dividerLight,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: defaultMarginValue),
                    title: Text(
                      '가나다초등학교',
                      style: context.textTheme.labelLarge
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      '인천광역시북부교육지원청',
                      style: context.textTheme.labelMedium?.copyWith(
                        color: AppTextColor.light,
                      ),
                    ),
                    onTap: () {},
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                    color: AppColor.dividerLight,
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
