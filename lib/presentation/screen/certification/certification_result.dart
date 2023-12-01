enum CertificationResultGender { male, female }

extension CertificationResultGenderExtension on CertificationResultGender {
  String get title {
    switch (this) {
      case CertificationResultGender.male:
        return '남성';
      case CertificationResultGender.female:
        return '여성';
    }
  }
}

class CertificationResult {
  final String ci;
  final String di;
  final String name;
  final String phoneNumber;
  final String birthDay;
  final CertificationResultGender gender;

  const CertificationResult({
    required this.ci,
    required this.di,
    required this.name,
    required this.phoneNumber,
    required this.birthDay,
    required this.gender,
  });
}
