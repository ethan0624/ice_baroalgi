import 'package:easy_localization/easy_localization.dart';

extension IntExtension on int {
  String get toNumberFormat => NumberFormat('###,###,###,###').format(this);
}
