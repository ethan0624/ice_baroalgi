import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/search/bloc/search_bloc.dart';
import 'package:incheon_knowhow/presentation/screen/search/widget/recently_keyword_view.dart';
import 'package:incheon_knowhow/presentation/screen/search/widget/related_result_view.dart';
import 'package:incheon_knowhow/presentation/widget/app_back_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/outline_button.dart';
import 'package:provider/provider.dart';

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

  _showResult() {
    print('>>>> _showResult : $_keyword');
    setState(() {
      _visibleSearchResult = true;
    });
  }

  _onSearchKeyword() {
    final bloc = _scaffoldKey.currentContext?.read<SearchBloc>();
    if (bloc == null) return;

    bloc.add(SearchEvent.search(_keyword));
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
              hintText: '코스명, 스팟명을 검색하세요.',
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
      create: (context) => SearchBloc(),
      builder: (context, bloc, state) {
        return Stack(
          children: [
            Positioned.fill(
              top: 12,
              left: 24,
              right: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    children: [
                      OutlineButton(
                        onPressed: () {},
                        backgroundColor: AppColor.primary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        text: '전체',
                        textColor: Colors.white,
                      ),
                      OutlineButton(
                        onPressed: () {},
                        // backgroundColor: AppColor.primary,
                        borderColor: AppColor.dividerMedium,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        text: '코스',
                        // textColor: Colors.white,
                      ),
                      OutlineButton(
                        onPressed: () {},
                        // backgroundColor: AppColor.primary,
                        borderColor: AppColor.dividerMedium,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        text: '스팟',
                        // textColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (_keyword.isEmpty) RecentlyKeywordView(),
            if (!_visibleSearchResult && _keyword.isNotEmpty)
              RelatedResultView(
                keyword: _keyword,
                onSearch: _showResult,
              ),
          ],
        );
      },
    );
  }
}
