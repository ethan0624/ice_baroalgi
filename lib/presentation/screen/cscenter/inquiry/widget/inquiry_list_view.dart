import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/model/qna.dart';
import 'package:incheon_knowhow/presentation/widget/accordian_list_view.dart';

class InquiryListView extends StatefulWidget {
  final List<Qna> items;
  const InquiryListView({super.key, this.items = const []});

  @override
  State<InquiryListView> createState() => _InquiryListViewState();
}

class _InquiryListViewState extends State<InquiryListView> {
  @override
  Widget build(BuildContext context) {
    return AccordianListView(
      itemCount: widget.items.length,
      titleBuilder: (context, index) {
        final qna = widget.items[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              qna.qustionTitle,
              style: context.textTheme.bodyMedium,
            ),
            Text(
              qna.createdAt,
              style: context.textTheme.labelMedium?.copyWith(
                color: AppTextColor.medium,
              ),
            ),
          ],
        );
      },
      contentBuilder: (context, index) {
        final qna = widget.items[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              qna.questionContent,
              style: context.textTheme.bodyMedium,
            ),
            Container(
              height: 1,
              margin: const EdgeInsets.symmetric(vertical: 12),
              color: AppColor.dividerDark,
            ),
            if (qna.isAnswer)
              Text(
                qna.answerContent ?? '',
                style: context.textTheme.bodyMedium,
              ),
          ],
        );
      },
    );
  }
}
