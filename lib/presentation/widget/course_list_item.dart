import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_event.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/int_extension.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/usecase/course/update_favorite.dart';
import 'package:incheon_knowhow/presentation/widget/label.dart';
import 'package:incheon_knowhow/presentation/widget/progress_bar.dart';
import 'package:incheon_knowhow/presentation/widget/thumbnail.dart';

class CourseListItem extends StatefulWidget {
  final Course course;
  final EdgeInsets margin;
  final EdgeInsets padding;
  const CourseListItem({
    super.key,
    required this.course,
    this.margin = const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    this.padding = const EdgeInsets.all(12),
  });

  @override
  State<CourseListItem> createState() => _CourseListItemState();
}

class _CourseListItemState extends State<CourseListItem>
    with AutomaticKeepAliveClientMixin {
  final _eventBus = getIt<EventBus>();
  final _updateFavorite = getIt<UpdateFavorite>();
  bool _isFavorite = false;
  double _progressValue = 0;
  int _completedSpotCount = 0;

  StreamSubscription? _changedSubscription;

  _onFavoritePressed() {
    context.checkLoginOrRequestLogin(
      onLoggedIn: () async {
        setState(() {
          _isFavorite = !_isFavorite;
        });

        final res = await _updateFavorite(widget.course.id);
        if (res.isSuccess()) {
          _eventBus.fire(
              CourseChangedEvent(widget.course.copyWith(isLiked: _isFavorite)));
        }
      },
    );
  }

  _onUpdated(Course updatedCourse) {
    setState(() {
      if (_isFavorite != updatedCourse.isLiked) {
        _isFavorite = updatedCourse.isLiked;
      }

      if (_progressValue != updatedCourse.progress) {
        _progressValue = updatedCourse.progress;
      }

      if (_completedSpotCount != updatedCourse.completedSpotCount) {
        _completedSpotCount = updatedCourse.completedSpotCount;
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _changedSubscription = _eventBus.on<CourseChangedEvent>().listen((event) {
      if (event.course.id == widget.course.id) {
        _onUpdated(event.course);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _isFavorite = widget.course.isLiked;
        _progressValue = widget.course.progress;
        _completedSpotCount = widget.course.completedSpotCount;
      });
    });
  }

  @override
  void dispose() {
    _changedSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      key: ValueKey(
          'course-list-item-${widget.course.id}-${widget.course.isLiked}'),
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColor.background),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () =>
            context.router.pushNamed('/course/${widget.course.id}/map'),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Thumbnail(
                  imageUrl: widget.course.image,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.course.regionName ?? '',
                        style: context.textTheme.labelMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        widget.course.title,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Wrap(
                          spacing: 4,
                          children: [
                            Label(
                              text: '${widget.course.km}km',
                              borderColor: AppColor.linePurple,
                            ),
                            Label(
                              text: (widget.course.hour > 0 &&
                                      widget.course.min > 0)
                                  ? '시간 분 소요'.tr(namedArgs: {
                                      'hour': '${widget.course.hour}',
                                      'min': '${widget.course.min}'
                                    })
                                  : (widget.course.hour > 0)
                                      ? '시간 소요'.tr(namedArgs: {
                                          'hour': '${widget.course.hour}'
                                        })
                                      : '분 소요'.tr(namedArgs: {
                                          'min': '${widget.course.min}'
                                        }),
                              borderColor: AppColor.lineBlue,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: ProgressBar(value: _progressValue),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              '${_completedSpotCount.toNumberFormat}/${widget.course.spotCount.toNumberFormat}',
                              style: context.textTheme.labelMedium
                                  ?.copyWith(color: AppTextColor.light),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: _onFavoritePressed,
                child: Icon(
                  _isFavorite
                      ? Icons.favorite_outlined
                      : Icons.favorite_outline,
                  size: 20,
                  color: _isFavorite ? AppColor.primary : Colors.grey,
                ),
              ),
            ),
            if (widget.course.isCompleted)
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.white38,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/course_complete_badge.png',
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
