import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/course/info/bloc/course_info_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/course_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/course_header.dart';
import 'package:incheon_knowhow/presentation/widget/image_slider.dart';
import 'package:incheon_knowhow/presentation/widget/spot_list_item.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CourseInfoScreen extends StatefulWidget {
  final int courseId;
  const CourseInfoScreen({super.key, @pathParam required this.courseId});

  @override
  State<CourseInfoScreen> createState() => _CourseInfoScreenState();
}

class _CourseInfoScreenState extends State<CourseInfoScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _title = '';
  bool _isFavorite = false;

  _onFavoritePressed() {
    context.checkLoginOrRequestLogin(onLoggedIn: () {
      final bloc = _scaffoldKey.currentContext?.read<CourseInfoBloc>();
      if (bloc == null) return;

      bloc.add(const CourseInfoEvent.toggleFavorite());
    });
  }

  _onSharedPressed() async {
    if (_title.isNotEmpty) {
      context.share(title: _title);
    }
  }

  _handleStateChanged(CourseInfoState state) {
    final course = state.course;
    if (course != null) {
      setState(() {
        _title = course.title;
        _isFavorite = course.isLiked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<CourseInfoBloc, CourseInfoBloc,
        CourseInfoState>(
      scaffoldKey: _scaffoldKey,
      appBar: CourseAppBar(
        text: _title,
        isFavorited: _isFavorite,
        onFavoritePressed: _onFavoritePressed,
        onSharedPressed: _onSharedPressed,
      ),
      create: (_) => CourseInfoBloc(courseId: widget.courseId)
        ..add(const CourseInfoEvent.initial()),
      stateChanged: (context, state) {
        _handleStateChanged(state);
      },
      builder: (context, bloc, state) {
        return (state.course == null)
            ? Container()
            : Stack(
                children: [
                  Positioned.fill(
                    bottom: 70,
                    child: ListView(
                      children: [
                        CourseHeader(
                          course: state.course!,
                        ),
                        if (state.course?.images?.isNotEmpty == true)
                          ImageSlider(
                            images: state.course?.images ?? [],
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultMarginValue),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultMarginValue, vertical: 12),
                          child: Text(
                            state.course?.description ?? '',
                            style: context.textTheme.labelLarge,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultMarginValue),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: const Size(10, 10),
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {},
                              child: Text(
                                '번역보기',
                                style: context.textTheme.labelLarge,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: defaultMarginValue),
                          height: 6,
                          color: AppColor.dividerLight,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: defaultMarginValue),
                          child: AppTitleText(text: '스팟 리스트'),
                        ),
                        const SizedBox(height: 6),
                        ...(state.course?.spots ?? []).map((e) => SpotListItem(
                              spot: e,
                            )),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultMarginValue, vertical: 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, -12),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: AppButton(
                        text: '코스 시작하기',
                        textBold: true,
                        padding: const EdgeInsets.all(10),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
