import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/model/school.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/search_school/bloc/search_school_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';

@RoutePage<School>()
class SearchSchoolScreen extends StatefulWidget {
  const SearchSchoolScreen({super.key});

  @override
  State<SearchSchoolScreen> createState() => _SearchSchoolScreenState();
}

class _SearchSchoolScreenState extends State<SearchSchoolScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _keywordTextController = TextEditingController();

  bool _hasKeyword = false;

  _onSearch() {
    if (_keywordTextController.text.isEmpty) {
      context.showAlert(title: '검색어 입력', message: '학교명을 입력해주세요');
      return;
    }

    final bloc = _scaffoldKey.currentContext?.read<SearchSchoolBloc>();
    if (bloc == null) return;

    bloc.add(SearchSchoolEvent.search(_keywordTextController.text));

    _hasKeyword = _keywordTextController.text.isNotEmpty;
  }

  _onSelected(School school) {
    context.router.pop(school);
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<SearchSchoolBloc, SearchSchoolBloc,
        SearchSchoolState>(
      scaffoldKey: _scaffoldKey,
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
            AppTextFormField(
              controller: _keywordTextController,
              margin: const EdgeInsets.symmetric(
                  horizontal: defaultMarginValue,
                  vertical: defaultMarginValue / 2),
              hintText: '학교명을 검색하세요',
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.search,
              onSubmitted: () => _onSearch,
              suffix: IconButton(
                onPressed: _onSearch,
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: const Size(10, 10),
                  padding: EdgeInsets.zero,
                ),
                icon: SvgPicture.asset(
                  'assets/images/ic_search.svg',
                  height: 18,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            if (state.schools.isNotEmpty)
              Container(
                height: 5,
                color: AppColor.dividerLight,
              ),
            (_hasKeyword && state.schools.isEmpty)
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Column(
                      children: [
                        Text(
                          '검색결과가 없습니다.',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: context.textTheme.bodySmall?.copyWith(
                                color: AppTextColor.light,
                              ),
                              children: [
                                const TextSpan(
                                    text:
                                        '검색한 학교가 없을 경우 학생 회원으로 가입하실 수 없습니다.\n'),
                                TextSpan(
                                  text: '일반 회원',
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: AppTextColor.dark,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const TextSpan(text: '으로 가입을 진행하시기 바랍니다.'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.schools.length,
                      itemBuilder: (context, index) {
                        final school = state.schools[index];
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: defaultMarginValue),
                          title: Text(
                            school.name,
                            style: context.textTheme.labelLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            school.organizationName,
                            style: context.textTheme.labelMedium?.copyWith(
                              color: AppTextColor.light,
                            ),
                          ),
                          onTap: () => _onSelected(school),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 1,
                          color: AppColor.dividerLight,
                        );
                      },
                    ),
                  ),
          ],
        );
      },
    );
  }
}
