// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/enum/course_state_type.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/dialog/course_stamp_dialog.dart';
import 'package:incheon_knowhow/presentation/screen/course/info/bloc/course_info_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/course_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/course_header.dart';
import 'package:incheon_knowhow/presentation/widget/image_slider.dart';
import 'package:incheon_knowhow/presentation/widget/spot_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/translate_text_view.dart';

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

  _startCourse() {
    context.checkLoginOrRequestLogin(onLoggedIn: () {
      final bloc = _scaffoldKey.currentContext?.read<CourseInfoBloc>();
      if (bloc == null) return;

      bloc.add(const CourseInfoEvent.start());
    });
  }

  _cancelCourse() {
    context.checkLoginOrRequestLogin(onLoggedIn: () async {
      final ret = await context.showConfirm(
          title: '정복을 중단하시겠습니까'.tr(),
          message: '진행중인 코스 리스트에서 삭제되어집니다 진행하시겠습니까'.tr());
      if (ret == null || ret == false) return;

      final bloc = _scaffoldKey.currentContext?.read<CourseInfoBloc>();
      if (bloc == null) return;

      bloc.add(const CourseInfoEvent.cancel());
    });
  }

  _requestStamp(Course course) async {
    context.checkLoginOrRequestLogin(onLoggedIn: () async {
      final ret =
          await CourseStampDialog.show(context, courseName: course.title);
      if (ret == null || ret == false) return;

      _showStampPoll();
    });
  }

  _showStampPoll() async {
    final ret = await context.router.pushNamed('/stamp/regist');
    if (ret == null || ret == false) return;

    context.router.navigateNamed('/main/home');
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
                        TranslateTextView(
                            text: state.course?.description ?? ''),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: defaultMarginValue),
                          height: 6,
                          color: AppColor.dividerLight,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultMarginValue),
                          child: AppTitleText(text: '스팟 리스트'.tr()),
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
                      child: Column(
                        children: [
                          if (state.course?.state == CourseStateType.completed)
                            AppButton(
                              text: '정복완료'.tr(),
                              textBold: true,
                              padding: const EdgeInsets.all(10),
                              background: AppColor.dividerDark,
                            ),
                          if (state.course?.state == CourseStateType.stampReady)
                            AppButton(
                              text: '정복완료'.tr(),
                              textBold: true,
                              padding: const EdgeInsets.all(10),
                              onPressed: () => _requestStamp(state.course!),
                            ),
                          if (state.course?.state == CourseStateType.inProgress)
                            AppButton(
                              text: '정복중'.tr(),
                              textBold: true,
                              padding: const EdgeInsets.all(10),
                              onPressed: _cancelCourse,
                            ),
                          if (state.course?.state == CourseStateType.ready)
                            AppButton(
                              text: '코스 시작하기'.tr(),
                              textBold: true,
                              padding: const EdgeInsets.all(10),
                              onPressed: _startCourse,
                            )
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
