import 'package:easy_localization/easy_localization.dart';

enum TermsAgreementType {
  legalRepresentative,
  privacy,
  thirdParties,
  location,
}

extension TermsAgreementTypeExtension on TermsAgreementType {
  String get title {
    switch (this) {
      case TermsAgreementType.legalRepresentative:
        return '14세 미만 법정대리인 동의'.tr();
      case TermsAgreementType.privacy:
        return '개인정보 수집 및 이용동의'.tr();
      case TermsAgreementType.thirdParties:
        return '개인정보 수집 목적 내 제3자 제공 동의'.tr();
      case TermsAgreementType.location:
        return '위치기반서비스 이용약관 동의'.tr();
    }
  }

  bool get isRequired => this != TermsAgreementType.location;
}
