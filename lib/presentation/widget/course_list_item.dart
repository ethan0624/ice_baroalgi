import 'dart:async';

import 'package:auto_route/auto_route.dart';
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
    if (_isFavorite == updatedCourse.isLiked) return;

    setState(() {
      _isFavorite = updatedCourse.isLiked;
    });
  }

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
    return Container(
      key: ValueKey('course-list-item-${widget.course.id}'),
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
                                  ? '${widget.course.hour}시간 ${widget.course.min}분 소요'
                                  : (widget.course.hour > 0)
                                      ? '${widget.course.hour}시간 소요'
                                      : '${widget.course.min}분 소요',
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
                              child: ProgressBar(value: widget.course.progress),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              '${widget.course.completedSpotCount.toNumberFormat}/${widget.course.spotCount.toNumberFormat}',
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
              child: IconButton(
                onPressed: _onFavoritePressed,
                icon: Icon(
                  _isFavorite
                      ? Icons.favorite_outlined
                      : Icons.favorite_outline,
                  size: 20,
                  color: _isFavorite ? AppColor.primary : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
