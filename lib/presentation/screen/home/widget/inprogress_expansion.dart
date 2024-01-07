import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/config/constrants.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';

class InprogressExpantion extends StatefulWidget {
  final List<Course> courseList;
  const InprogressExpantion({super.key, required this.courseList});

  @override
  State<InprogressExpantion> createState() => _InprogressExpantionState();
}

class _InprogressExpantionState extends State<InprogressExpantion> {
  bool _expended = false;
  int _pageIndex = 0;

  _onToggleExpantion() {
    setState(() {
      _expended = !_expended;
    });
  }

  _onPageChanged(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.secondary.withOpacity(0.4),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: _onToggleExpantion,
            splashFactory: NoSplash.splashFactory,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.primary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '정복중인 코드',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: _expended ? 1 : 0,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: AnimationDuration.shortest,
            crossFadeState: _expended
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            sizeCurve: Curves.fastOutSlowIn,
            firstChild: Container(),
            secondChild: Column(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                child: CarouselSlider.builder(
                  itemCount: widget.courseList.length,
                  itemBuilder: (context, index, realIndex) {
                    final course = widget.courseList[index];
                    return CourseListItem(
                      course: course,
                      margin: EdgeInsets.zero,
                    );
                  },
                  options: CarouselOptions(
                    height: 118,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) => _onPageChanged(index),
                  ),
                ),
              ),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.courseList.length,
                      (index) => Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              index == _pageIndex ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 10,
                    child: InkWell(
                      onTap: () =>
                          context.router.navigateNamed('/main/myCourse'),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 4,
                        children: [
                          Text(
                            '더보기',
                            style: context.textTheme.labelMedium
                                ?.copyWith(color: AppTextColor.medium),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: AppTextColor.medium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ]),
          ),
        ],
      ),
    );
  }
}
