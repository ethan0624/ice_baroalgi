import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class AppTextFormField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final double border;
  final double borderRadius;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color backgroundColor;
  final EdgeInsets contentPadding;
  final bool isObscureText;
  final bool readOnly;
  final EdgeInsets margin;
  final Widget? suffix;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?)? validator;
  final VoidCallback? onSubmitted;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextFormField({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.textStyle,
    this.textAlign,
    this.hintText,
    this.hintTextStyle,
    this.keyboardType,
    this.textInputAction,
    this.border = 1,
    this.borderRadius = 10,
    this.borderColor = const Color(0xFFDBDBDB),
    this.focusBorderColor = const Color(0xFFE65185),
    this.backgroundColor = Colors.white,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
    this.isObscureText = false,
    this.readOnly = false,
    this.margin = const EdgeInsets.symmetric(vertical: 12),
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.validator,
    this.onSubmitted,
    this.onTap,
    this.onChanged,
    this.enabled = true,
    this.autoFocus = false,
    this.suffix,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                label ?? '',
                style: context.textTheme.bodySmall,
              ),
            ),
          TextFormField(
            controller: controller,
            focusNode: focusNode,
            style: textStyle ?? context.textTheme.bodyMedium,
            autofocus: autoFocus,
            obscureText: isObscureText,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 80),
            decoration: InputDecoration(
              counterText: '',
              hintText: hintText,
              hintStyle: hintTextStyle ??
                  context.textTheme.bodyMedium
                      ?.copyWith(color: AppTextColor.light),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: border > 0
                    ? BorderSide(
                        color: borderColor ?? context.colorScheme.outline,
                        width: border)
                    : BorderSide.none,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: border > 0
                    ? BorderSide(
                        color: borderColor ?? context.colorScheme.outline,
                        width: border)
                    : BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: border > 0
                    ? BorderSide(
                        color: focusBorderColor ?? context.colorScheme.primary,
                        width: border)
                    : BorderSide.none,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: border > 0
                    ? BorderSide(
                        color: context.colorScheme.error, width: border)
                    : BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: border > 0
                    ? BorderSide(
                        color: context.colorScheme.error, width: border)
                    : BorderSide.none,
              ),
              isDense: true,
              contentPadding: contentPadding,
              filled: true,
              fillColor: enabled ? backgroundColor : AppColor.dividerDark,
              suffix: suffix,
            ),
            maxLength: maxLength,
            maxLines: maxLines,
            minLines: minLines,
            textInputAction: textInputAction,
            textAlign: textAlign ?? TextAlign.start,
            readOnly: readOnly,
            onFieldSubmitted: (message) {
              onSubmitted?.call();
            },
            textCapitalization: TextCapitalization.none,
            validator: validator,
            onSaved: (value) {
              controller?.text = value ?? '';
            },
            onChanged: (value) {
              onChanged?.call(value);
            },
            onTap: onTap,
            enabled: enabled,
          ),
        ],
      ),
    );
  }
}
