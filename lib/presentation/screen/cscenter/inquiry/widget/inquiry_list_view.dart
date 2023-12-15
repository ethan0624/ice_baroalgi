import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/accordian_list_view.dart';

class InquiryListView extends StatefulWidget {
  const InquiryListView({super.key});

  @override
  State<InquiryListView> createState() => _InquiryListViewState();
}

class _InquiryListViewState extends State<InquiryListView> {
  @override
  Widget build(BuildContext context) {
    return AccordianListView(
      itemCount: 20,
      titleBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '문의 제목이 작성됩니다.',
              style: context.textTheme.bodyMedium,
            ),
            Text(
              '2023.12.04',
              style: context.textTheme.labelMedium?.copyWith(
                color: AppTextColor.medium,
              ),
            ),
          ],
        );
      },
      contentBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '문의내용이 작성됩니다.',
              style: context.textTheme.bodyMedium,
            ),
            Container(
              height: 1,
              margin: const EdgeInsets.symmetric(vertical: 12),
              color: AppColor.dividerDark,
            ),
            Text(
              '답변내용이 작성됩니다.',
              style: context.textTheme.bodyMedium,
            ),
          ],
        );
      },
    );
  }
}
