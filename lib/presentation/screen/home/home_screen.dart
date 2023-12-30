import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/enum/region_category_type.dart';
import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/home/bloc/home_bloc.dart';
import 'package:incheon_knowhow/presentation/screen/home/widget/home_app_bar.dart';
import 'package:incheon_knowhow/presentation/screen/home/widget/recommend_course_list_view.dart';
import 'package:incheon_knowhow/presentation/screen/home/widget/region_course_list_view.dart';
import 'package:incheon_knowhow/presentation/screen/home/widget/topic_course_list_view.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();

  _onExpanededTopic(int topicId, bool isExpaneded) {
    final bloc = _scaffoldKey.currentContext?.read<HomeBloc>();
    if (bloc == null) return;

    bloc.add(HomeEvent.expanededTopic(topicId, isExpaneded));
  }

  _onRegionChanged(RegionCategoryType regionCategoryType) {
    final bloc = _scaffoldKey.currentContext?.read<HomeBloc>();
    if (bloc == null) return;

    bloc.add(HomeEvent.changeRegion(regionCategoryType));
  }

  _onRecommendChanged(Category recommendCategory) {
    final bloc = _scaffoldKey.currentContext?.read<HomeBloc>();
    if (bloc == null) return;

    bloc.add(HomeEvent.changeRecommend(recommendCategory));
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<HomeBloc, HomeBloc, HomeState>(
      scaffoldKey: _scaffoldKey,
      create: (_) => HomeBloc()..add(const HomeEvent.initial()),
      appBar: HomeAppBar(
        onSearchPressed: () {
          // todo: push search screen
        },
        onNotificationPressed: () {
          context.router.pushNamed('/notification');
        },
      ),
      builder: (context, bloc, state) {
        return DefaultTabController(
          length: 3,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [
                    if (state.inProgressCourse.isNotEmpty)
                      AppButton(
                        margin: const EdgeInsets.symmetric(
                            horizontal: defaultMarginValue),
                        width: double.infinity,
                        text: '정복중인 코스',
                        textBold: true,
                        centerText: false,
                        suffixIcon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // todo: push route
                        },
                      ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultMarginValue),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColor.dividerLight,
                          ),
                        ),
                      ),
                      child: TabBar(
                        indicator: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.5, color: AppColor.secondary),
                          ),
                        ),
                        splashFactory: NoSplash.splashFactory,
                        padding: EdgeInsets.zero,
                        dividerColor: Colors.transparent,
                        unselectedLabelColor: AppTextColor.light,
                        unselectedLabelStyle: context.textTheme.bodyMedium,
                        labelColor: Colors.black,
                        labelStyle: context.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                        tabs: ['주제별 코스', '권역별 코스', '추천 코스']
                            .map(
                              (e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  e,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          TopicCourseListView(
                            topicCourse: state.topicCourse,
                            expandedTopicId: state.expandedTopicId,
                            // scrollController: _scrollController,
                            onExpaned: _onExpanededTopic,
                          ),
                          RegionCourseListView(
                            regions: RegionCategoryType.values,
                            selectedRegion: state.selectedRegionCategoryType,
                            courseList: state.filterRegionCourse,
                            // scrollController: _scrollController,
                            onRegionChanged: _onRegionChanged,
                          ),
                          RecommendCourseListView(
                            recommends: state.recommendCategories,
                            courseList: state.filterRecommendCourse,
                            selectedRecommend: state.selectedRecommendCategory,
                            onRecommendChanged: _onRecommendChanged,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
