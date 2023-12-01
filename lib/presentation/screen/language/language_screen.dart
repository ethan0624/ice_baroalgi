import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/locale_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_layout.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';

@RoutePage()
class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<Locale> _supportedLocales = [];

  _onChangedLanguage(Locale locale) async {
    context.setLocale(locale);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _supportedLocales =
            EasyLocalization.of(context)?.supportedLocales ?? [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBar: AppSubAppBar(text: '언어'.tr()),
      child: ListView(
        padding: const EdgeInsets.all(26),
        children: _supportedLocales
            .map(
              (e) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColor.dividerLight, width: 1),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    e.flag,
                    style: context.textTheme.titleSmall,
                  ),
                ),
                title: Text(
                  e.title,
                  style: context.textTheme.titleSmall,
                ),
                trailing: context.locale.languageCode == e.languageCode
                    ? const Icon(
                        Icons.check_rounded,
                        color: Colors.black,
                      )
                    : null,
                onTap: () => _onChangedLanguage(e),
              ),
            )
            .toList(),
      ),
    );
  }
}
