import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incheon_knowhow/core/extension/string_extension.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/icon_text.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? hint;
  final EdgeInsets margin;
  final bool? autoFocus;
  final VoidCallback? onSubmitted;
  final Function(TextEditingController controller)? onCreated;

  const PasswordFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.hint,
    this.margin = const EdgeInsets.symmetric(vertical: 14),
    this.autoFocus,
    this.onSubmitted,
    this.onCreated,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  final _textController = TextEditingController();
  final _passIconPath = 'assets/images/ic_checked.svg';
  final _failIconPath = 'assets/images/ic_close.svg';
  bool _showPassword = false;
  bool _containAlphabet = false;
  bool _containNumber = false;
  bool _minLength = false;

  _onTextChanged() {
    final text = _textController.text;
    setState(() {
      _containAlphabet = text.hasAlphabet();
      _containNumber = text.hasNumber();
      _minLength = text.length >= 8;

      if (_containAlphabet && _containNumber && _minLength) {
        widget.controller?.text = text;
      } else {
        widget.controller?.text = '';
      }
    });
  }

  _togglePasswordShow() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void initState() {
    super.initState();

    _textController.addListener(_onTextChanged);
    widget.onCreated?.call(_textController);
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AppTextFormField(
                controller: _textController,
                focusNode: widget.focusNode,
                hintText: widget.hint ?? '비밀번호 입력'.tr(),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: widget.textInputAction ?? TextInputAction.done,
                maxLength: 40,
                margin: EdgeInsets.zero,
                isObscureText: !_showPassword,
                onSubmitted: widget.onSubmitted,
                autoFocus: widget.autoFocus ?? false,
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 12,
                child: InkWell(
                  onTap: _togglePasswordShow,
                  child: SvgPicture.asset(
                    _showPassword
                        ? 'assets/images/ic_password_show.svg'
                        : 'assets/images/ic_password_hide.svg',
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              IconText(
                icon: SvgPicture.asset(
                  _containAlphabet ? _passIconPath : _failIconPath,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                      _containAlphabet ? Colors.green : Colors.red,
                      BlendMode.srcIn),
                ),
                label: '영문포함'.tr(),
              ),
              IconText(
                icon: SvgPicture.asset(
                  _containNumber ? _passIconPath : _failIconPath,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                      _containNumber ? Colors.green : Colors.red,
                      BlendMode.srcIn),
                ),
                label: '숫자포함'.tr(),
              ),
              IconText(
                icon: SvgPicture.asset(
                  _minLength ? _passIconPath : _failIconPath,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                      _minLength ? Colors.green : Colors.red, BlendMode.srcIn),
                ),
                label: '8자 이상'.tr(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
