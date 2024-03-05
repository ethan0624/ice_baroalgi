import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/search/bloc/search_bloc.dart';
import 'package:incheon_knowhow/presentation/screen/search/widget/recently_keyword_view.dart';
import 'package:incheon_knowhow/presentation/screen/search/widget/related_result_view.dart';
import 'package:incheon_knowhow/presentation/screen/search/widget/search_result_all_view.dart';
import 'package:incheon_knowhow/presentation/widget/app_back_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/outline_button.dart';
import 'package:incheon_knowhow/presentation/widget/spot_list_item.dart';
import 'package:provider/provider.dart';

enum SearchResultType { all, course, spot }

extension SearchResultTypeExtension on SearchResultType {
  String get title {
    switch (this) {
      case SearchResultType.all:
        return '전체'.tr();
      case SearchResultType.course:
        return '코스'.tr();
      case SearchResultType.spot:
        return '스팟'.tr();
    }
  }
}

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _keywordController = TextEditingController();

  Timer? _throttleTimer;

  String _keyword = '';
  bool _visibleSearchResult = false;

  SearchResultType _selsectedSearchResultType = SearchResultType.all;

  _showResult() {
    setState(() {
      _visibleSearchResult = true;
    });
  }

  _onSearchKeyword() {
    final bloc = _scaffoldKey.currentContext?.read<SearchBloc>();
    if (bloc == null) return;

    bloc.add(SearchEvent.search(_keyword));
  }

  _onSearchResultType(SearchResultType resultType) {
    setState(() {
      _selsectedSearchResultType = resultType;
    });
  }

  _searchWithThrottle(String keyword) {
    _throttleTimer?.cancel();

    if (keyword.isNotEmpty) {
      _throttleTimer =
          Timer.periodic(const Duration(milliseconds: 500), (timer) {
        _throttleTimer?.cancel();
        _onSearchKeyword();
      });
    }
  }

  _handleKeywordChanged() {
    final keyword = _keywordController.text;
    _searchWithThrottle(keyword);
    setState(() {
      _keyword = keyword;
      _visibleSearchResult = false;
    });
  }

  _onRecentKeywordPressed(String keyword) {
    _keywordController.text = keyword;
    _searchWithThrottle(keyword);
    setState(() {
      _keyword = keyword;
      _visibleSearchResult = false;
    });
  }

  _onRecentKeywordDeletePressed(String keyword) {
    final bloc = _scaffoldKey.currentContext?.read<SearchBloc>();
    if (bloc == null) return;

    bloc.add(SearchEvent.deleteRecentKeyword(keyword));
  }

  _onRecentKeywordClearPressed() {
    final bloc = _scaffoldKey.currentContext?.read<SearchBloc>();
    if (bloc == null) return;

    bloc.add(const SearchEvent.clearRecentKeyword());
  }

  @override
  void initState() {
    super.initState();

    _keywordController.addListener(_handleKeywordChanged);
  }

  @override
  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();
    _keywordController.removeListener(_handleKeywordChanged);
    _throttleTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<SearchBloc, SearchBloc, SearchState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: const AppBackButton(),
        title: Stack(
          children: [
            AppTextFormField(
              controller: _keywordController,
              hintText: '코스명 스팟명을 검색하세요'.tr(),
              textInputAction: TextInputAction.search,
            ),
            Positioned(
              right: 10,
              bottom: 22,
              child: SvgPicture.asset(
                'assets/images/ic_search.svg',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
      create: (context) => SearchBloc()..add(const SearchEvent.initial()),
      stateChanged: (context, state) {
        print('>>>>>> state : ${state.recentKeywords}');
      },
      builder: (context, bloc, state) {
        return Stack(
          children: [
            Positioned.fill(
              top: 12,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Wrap(
                        spacing: 8,
                        children: SearchResultType.values
                            .map((e) => OutlineButton(
                                  onPressed: () => _onSearchResultType(e),
                                  backgroundColor:
                                      e == _selsectedSearchResultType
                                          ? AppColor.primary
                                          : Colors.transparent,
                                  borderColor: e == _selsectedSearchResultType
                                      ? AppColor.primary
                                      : AppColor.dividerMedium,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  text: e.title,
                                  textColor: e == _selsectedSearchResultType
                                      ? Colors.white
                                      : null,
                                ))
                            .toList(),
                      ),
                    ),
                    if (_selsectedSearchResultType == SearchResultType.all)
                      SearchResultAllView(
                        courses: state.searchCourses,
                        spots: state.searchSpots,
                        onCourseMorePressed: () =>
                            _onSearchResultType(SearchResultType.course),
                        onSpotMorePressed: () =>
                            _onSearchResultType(SearchResultType.spot),
                      ),
                    if (_selsectedSearchResultType == SearchResultType.course)
                      Column(
                        children: [
                          const SizedBox(height: 12),
                          ...state.searchCourses
                              .map((e) => CourseListItem(course: e)),
                        ],
                      ),
                    if (_selsectedSearchResultType == SearchResultType.spot)
                      Column(
                        children: [
                          const SizedBox(height: 12),
                          ...state.searchSpots
                              .map((e) => SpotListItem(spot: e)),
                        ],
                      )
                  ],
                ),
              ),
            ),
            if (_keyword.isEmpty)
              RecentlyKeywordView(
                keywords: state.recentKeywords.map((e) => e.keyword).toList(),
                onKeywordPressed: _onRecentKeywordPressed,
                onDeletePressed: _onRecentKeywordDeletePressed,
                onClearPressed: _onRecentKeywordClearPressed,
              ),
            if (!_visibleSearchResult && _keyword.isNotEmpty)
              RelatedResultView(
                keyword: _keyword,
                results: state.relateResults,
                onSearch: _showResult,
              ),
          ],
        );
      },
    );
  }
}
