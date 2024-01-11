import 'package:easy_localization/easy_localization.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
      children: [
        Text(
          '문의제목'.tr(),
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        AppTextFormField(
          hintText: '문의제목을 입력하세요 80자 이내'.tr(),
          maxLength: 80,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 12),
        Text(
          '문의내용'.tr(),
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        AppTextFormField(
          hintText: '문의내용을 입력하세요  2,000자 이내'.tr(),
          maxLength: 2000,
          maxLines: 10,
          minLines: 5,
          keyboardType: TextInputType.multiline,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            Text(
              '파일첨부 선택'.tr(),
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              '최대 5개, 30MB까지 등록가능'.tr(),
              style: context.textTheme.labelLarge
                  ?.copyWith(color: AppTextColor.medium),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
          margin: const EdgeInsets.symmetric(vertical: defaultMarginValue),
          text: '문의남기기'.tr(),
          onPressed: () {},
        ),
      ],
    );
  }
}
