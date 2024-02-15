import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/bottomsheet/image_picker_bottom_sheet.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';

class InqueryFormData {
  final String title;
  final String question;
  final List<File>? files;

  const InqueryFormData({
    required this.title,
    required this.question,
    this.files,
  });
}

class InquiryForm extends StatefulWidget {
  final ValueChanged<InqueryFormData>? onSubmit;
  const InquiryForm({
    super.key,
    this.onSubmit,
  });

  @override
  State<InquiryForm> createState() => InquiryFormState();
}

class InquiryFormState extends State<InquiryForm> {
  final _titleController = TextEditingController();
  final _questionController = TextEditingController();
  final List<File> _uploadFiles = [];

  _showImagePicker() async {
    if (_uploadFiles.length >= 5) {
      context.showAlert(title: '파일은 최대 5장까지만 업로드 가능합니다'.tr());
      return;
    }
    final ret = await ImagePickerBottomSheet.show(context);
    if (ret == null) return;

    setState(() {
      _uploadFiles.add(ret);
    });
  }

  _onUploadFileDelete(int index) async {
    final ret = await context.showConfirm(title: '첨부한 파일을 삭제하시겠습니까?'.tr());
    if (ret == null || ret == false) return;

    setState(() {
      _uploadFiles.removeAt(index);
    });
  }

  _onSubmit() {
    final title = _titleController.text;
    final question = _questionController.text;

    if (title.isEmpty || question.isEmpty) {
      context.showAlert(title: '문의내용을 입력해주세요'.tr());
      return;
    }

    final data = InqueryFormData(
      title: title,
      question: question,
      files: _uploadFiles,
    );

    widget.onSubmit?.call(data);
  }

  onClear() {
    setState(() {
      _titleController.clear();
      _questionController.clear();
      _uploadFiles.clear();
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

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
          controller: _titleController,
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
          controller: _questionController,
          hintText: '문의내용을 입력하세요 2000자 이내'.tr(),
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
              InkWell(
                onTap: _showImagePicker,
                child: Container(
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
                        '${_uploadFiles.length}/5',
                        style: context.textTheme.labelSmall
                            ?.copyWith(color: AppTextColor.light),
                      ),
                    ],
                  ),
                ),
              ),
              ..._uploadFiles.mapIndexed(
                (index, e) => Container(
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
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            e,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () => _onUploadFileDelete(index),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade500,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        AppButton(
          margin: const EdgeInsets.symmetric(vertical: defaultMarginValue),
          text: '문의남기기'.tr(),
          onPressed: _onSubmit,
        ),
      ],
    );
  }
}
