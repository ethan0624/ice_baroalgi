import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incheon_knowhow/core/extension/string_extension.dart';
import 'package:incheon_knowhow/presentation/bottomsheet/bottom_sheet_item.dart';
import 'package:incheon_knowhow/presentation/bottomsheet/drag_handle_bottom_sheet_layout.dart';

class ImagePickerBottomSheet extends StatefulWidget {
  const ImagePickerBottomSheet({Key? key}) : super(key: key);

  static Future<File?> show(BuildContext context) {
    return showModalBottomSheet<File>(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return const ImagePickerBottomSheet();
        });
  }

  @override
  State<ImagePickerBottomSheet> createState() => _ImagePickerBottomSheetState();
}

class _ImagePickerBottomSheetState extends State<ImagePickerBottomSheet> {
  final ImagePicker _picker = ImagePicker();

  _onPickImage(ImageSource source) async {
    try {
      XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        final path = pickedFile.path;
        File compressImage = File(pickedFile.path);
        if (path.ext() != 'gif') {
          compressImage = await FlutterNativeImage.compressImage(
            pickedFile.path,
            quality: 60,
          );
          await File(pickedFile.path).delete();
        }

        context.router.pop(compressImage);
      } else {
        context.router.pop();
      }
    } catch (e, s) {
      debugPrint('********* image picker : $e, $s');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DragHandleBottomSheetLayout(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      useCancelButton: false,
      children: [
        BottomSheetItem(
          title: '앨범에서 사진 선택'.tr(),
          icon: Icons.image,
          onTap: () => _onPickImage(ImageSource.gallery),
        ),
        BottomSheetItem(
          title: '카메라 촬영'.tr(),
          icon: Icons.camera_alt_outlined,
          onTap: () => _onPickImage(ImageSource.camera),
        ),
      ],
    );
  }
}
