import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/config/constrants.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/model/topic_course.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/dummy_thumbnail.dart';
import 'package:incheon_knowhow/presentation/widget/thumbnail.dart';

class CourseTopicExpansion extends StatefulWidget {
  final TopicCourse topicCourse;
  final bool expended;
  final ValueChanged<bool>? onExpended;
  const CourseTopicExpansion({
    super.key,
    required this.topicCourse,
    this.expended = false,
    this.onExpended,
  });

  @override
  State<CourseTopicExpansion> createState() => _CourseTopicExpansionState();
}

class _CourseTopicExpansionState extends State<CourseTopicExpansion> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onExpended?.call(!widget.expended);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 12,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      DummyThumbnail(
                        assetPath: widget.topicCourse.thumbnail,
                        width: 65,
                        height: 65,
                      ),
                      // todo : 주제별 코스 썸네일 정보 추가서 처리 예정
                      const Offstage(
                        offstage: true,
                        child: Thumbnail(
                          width: 65,
                          height: 65,
                        ),
                      ),
                      Text(
                        widget.topicCourse.title,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                RotatedBox(
                  quarterTurns: widget.expended ? 1 : 0,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          AnimatedCrossFade(
            duration: AnimationDuration.shortest,
            crossFadeState: widget.expended
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            sizeCurve: Curves.fastOutSlowIn,
            firstChild: Container(),
            secondChild: Container(
              width: double.infinity,
              color: AppColor.background,
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                children: widget.topicCourse.courses
                        ?.map((e) => CourseListItem(
                              course: e,
                            ))
                        .toList() ??
                    [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
