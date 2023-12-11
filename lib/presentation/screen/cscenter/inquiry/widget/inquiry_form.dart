import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';

class InquiryForm extends StatefulWidget {
  const InquiryForm({super.key});

  @override
  State<InquiryForm> createState() => _InquiryFormState();
}

class _InquiryFormState extends State<InquiryForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      children: [
        Text(
          '문의제목',
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        const AppTextFormField(
          hintText: '문의제목을 입력하세요. (80자 이내)',
          maxLength: 80,
          keyboardType: TextInputType.text,
        ),
        Text(
          '문의내용',
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        const AppTextFormField(
          hintText: '문의내용을 입력하세요. (2,000자 이내)',
          maxLength: 2000,
          maxLines: 10,
          minLines: 5,
          keyboardType: TextInputType.multiline,
        ),
        Wrap(
          spacing: 8,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            Text(
              '파일첨부(선택)',
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              '최대 5개, 30MB까지 등록가능',
              style: context.textTheme.labelLarge
                  ?.copyWith(color: AppTextColor.medium),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: AppColor.dividerMedium,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColor.dividerDark,
                    ),
                    Text(
                      '0/5',
                      style: context.textTheme.labelSmall
                          ?.copyWith(color: AppTextColor.light),
                    ),
                  ],
                ),
              ),
              ...List.generate(
                5,
                (index) => Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: AppColor.dividerMedium,
                    ),
                    color: AppColor.dividerLight,
                  ),
                ),
              ),
            ],
          ),
        ),
        AppButton(
          margin: const EdgeInsets.symmetric(vertical: 24),
          text: '문의남기기',
          onPressed: () {},
        ),
      ],
    );
  }
}
