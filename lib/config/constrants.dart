const isRelease = bool.fromEnvironment('dart.vm.product');

class AnimationDuration {
  static const Duration zero = Duration.zero;
  static const Duration shortest = Duration(milliseconds: 150);
  static const Duration short = Duration(milliseconds: 250);
  static const Duration medium = Duration(milliseconds: 500);
  static const Duration long = Duration(milliseconds: 850);
}
