// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CertificationRoute.name: (routeData) {
      return AutoRoutePage<CertificationResult>(
        routeData: routeData,
        child: const CertificationScreen(),
      );
    },
    FindIdRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FindIdScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    JinroAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JinroAccountScreen(),
      );
    },
    JoinAgreementRoute.name: (routeData) {
      final args = routeData.argsAs<JoinAgreementRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JoinAgreementScreen(
          key: args.key,
          joinData: args.joinData,
        ),
      );
    },
    JoinCertificationRoute.name: (routeData) {
      final args = routeData.argsAs<JoinCertificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JoinCertificationScreen(
          key: args.key,
          joinData: args.joinData,
        ),
      );
    },
    JoinCompleteRoute.name: (routeData) {
      final args = routeData.argsAs<JoinCompleteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JoinCompleteScreen(
          key: args.key,
          userName: args.userName,
        ),
      );
    },
    JoinRegistRoute.name: (routeData) {
      final args = routeData.argsAs<JoinRegistRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JoinRegistScreen(
          key: args.key,
          joinData: args.joinData,
        ),
      );
    },
    JoinUserInfoRoute.name: (routeData) {
      final args = routeData.argsAs<JoinUserInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JoinUserInfoScreen(
          key: args.key,
          joinData: args.joinData,
        ),
      );
    },
    JoinUserTypeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JoinUserTypeScreen(),
      );
    },
    LanguageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LanguageScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    MainTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainTabScreen(),
      );
    },
    MyCourseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyCourseScreen(),
      );
    },
    MypageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MypageScreen(),
      );
    },
    NoticeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NoticeScreen(),
      );
    },
    NotificationDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationDetailScreen(),
      );
    },
    NotificationListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationListScreen(),
      );
    },
    ResetPwCertificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPwCertificationScreen(),
      );
    },
    ResetPwFormRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPwFormScreen(),
      );
    },
    ResetPwUpdateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPwUpdateScreen(),
      );
    },
    SearchSchoolRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchSchoolScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [CertificationScreen]
class CertificationRoute extends PageRouteInfo<void> {
  const CertificationRoute({List<PageRouteInfo>? children})
      : super(
          CertificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'CertificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FindIdScreen]
class FindIdRoute extends PageRouteInfo<void> {
  const FindIdRoute({List<PageRouteInfo>? children})
      : super(
          FindIdRoute.name,
          initialChildren: children,
        );

  static const String name = 'FindIdRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JinroAccountScreen]
class JinroAccountRoute extends PageRouteInfo<void> {
  const JinroAccountRoute({List<PageRouteInfo>? children})
      : super(
          JinroAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'JinroAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JoinAgreementScreen]
class JoinAgreementRoute extends PageRouteInfo<JoinAgreementRouteArgs> {
  JoinAgreementRoute({
    Key? key,
    required JoinData joinData,
    List<PageRouteInfo>? children,
  }) : super(
          JoinAgreementRoute.name,
          args: JoinAgreementRouteArgs(
            key: key,
            joinData: joinData,
          ),
          initialChildren: children,
        );

  static const String name = 'JoinAgreementRoute';

  static const PageInfo<JoinAgreementRouteArgs> page =
      PageInfo<JoinAgreementRouteArgs>(name);
}

class JoinAgreementRouteArgs {
  const JoinAgreementRouteArgs({
    this.key,
    required this.joinData,
  });

  final Key? key;

  final JoinData joinData;

  @override
  String toString() {
    return 'JoinAgreementRouteArgs{key: $key, joinData: $joinData}';
  }
}

/// generated route for
/// [JoinCertificationScreen]
class JoinCertificationRoute extends PageRouteInfo<JoinCertificationRouteArgs> {
  JoinCertificationRoute({
    Key? key,
    required JoinData joinData,
    List<PageRouteInfo>? children,
  }) : super(
          JoinCertificationRoute.name,
          args: JoinCertificationRouteArgs(
            key: key,
            joinData: joinData,
          ),
          initialChildren: children,
        );

  static const String name = 'JoinCertificationRoute';

  static const PageInfo<JoinCertificationRouteArgs> page =
      PageInfo<JoinCertificationRouteArgs>(name);
}

class JoinCertificationRouteArgs {
  const JoinCertificationRouteArgs({
    this.key,
    required this.joinData,
  });

  final Key? key;

  final JoinData joinData;

  @override
  String toString() {
    return 'JoinCertificationRouteArgs{key: $key, joinData: $joinData}';
  }
}

/// generated route for
/// [JoinCompleteScreen]
class JoinCompleteRoute extends PageRouteInfo<JoinCompleteRouteArgs> {
  JoinCompleteRoute({
    Key? key,
    required String userName,
    List<PageRouteInfo>? children,
  }) : super(
          JoinCompleteRoute.name,
          args: JoinCompleteRouteArgs(
            key: key,
            userName: userName,
          ),
          initialChildren: children,
        );

  static const String name = 'JoinCompleteRoute';

  static const PageInfo<JoinCompleteRouteArgs> page =
      PageInfo<JoinCompleteRouteArgs>(name);
}

class JoinCompleteRouteArgs {
  const JoinCompleteRouteArgs({
    this.key,
    required this.userName,
  });

  final Key? key;

  final String userName;

  @override
  String toString() {
    return 'JoinCompleteRouteArgs{key: $key, userName: $userName}';
  }
}

/// generated route for
/// [JoinRegistScreen]
class JoinRegistRoute extends PageRouteInfo<JoinRegistRouteArgs> {
  JoinRegistRoute({
    Key? key,
    required JoinData joinData,
    List<PageRouteInfo>? children,
  }) : super(
          JoinRegistRoute.name,
          args: JoinRegistRouteArgs(
            key: key,
            joinData: joinData,
          ),
          initialChildren: children,
        );

  static const String name = 'JoinRegistRoute';

  static const PageInfo<JoinRegistRouteArgs> page =
      PageInfo<JoinRegistRouteArgs>(name);
}

class JoinRegistRouteArgs {
  const JoinRegistRouteArgs({
    this.key,
    required this.joinData,
  });

  final Key? key;

  final JoinData joinData;

  @override
  String toString() {
    return 'JoinRegistRouteArgs{key: $key, joinData: $joinData}';
  }
}

/// generated route for
/// [JoinUserInfoScreen]
class JoinUserInfoRoute extends PageRouteInfo<JoinUserInfoRouteArgs> {
  JoinUserInfoRoute({
    Key? key,
    required JoinData joinData,
    List<PageRouteInfo>? children,
  }) : super(
          JoinUserInfoRoute.name,
          args: JoinUserInfoRouteArgs(
            key: key,
            joinData: joinData,
          ),
          initialChildren: children,
        );

  static const String name = 'JoinUserInfoRoute';

  static const PageInfo<JoinUserInfoRouteArgs> page =
      PageInfo<JoinUserInfoRouteArgs>(name);
}

class JoinUserInfoRouteArgs {
  const JoinUserInfoRouteArgs({
    this.key,
    required this.joinData,
  });

  final Key? key;

  final JoinData joinData;

  @override
  String toString() {
    return 'JoinUserInfoRouteArgs{key: $key, joinData: $joinData}';
  }
}

/// generated route for
/// [JoinUserTypeScreen]
class JoinUserTypeRoute extends PageRouteInfo<void> {
  const JoinUserTypeRoute({List<PageRouteInfo>? children})
      : super(
          JoinUserTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoinUserTypeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LanguageScreen]
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute({List<PageRouteInfo>? children})
      : super(
          LanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    void Function(bool)? onResult,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.onResult,
  });

  final Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [MainTabScreen]
class MainTabRoute extends PageRouteInfo<void> {
  const MainTabRoute({List<PageRouteInfo>? children})
      : super(
          MainTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyCourseScreen]
class MyCourseRoute extends PageRouteInfo<void> {
  const MyCourseRoute({List<PageRouteInfo>? children})
      : super(
          MyCourseRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCourseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MypageScreen]
class MypageRoute extends PageRouteInfo<void> {
  const MypageRoute({List<PageRouteInfo>? children})
      : super(
          MypageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MypageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoticeScreen]
class NoticeRoute extends PageRouteInfo<void> {
  const NoticeRoute({List<PageRouteInfo>? children})
      : super(
          NoticeRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoticeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationDetailScreen]
class NotificationDetailRoute extends PageRouteInfo<void> {
  const NotificationDetailRoute({List<PageRouteInfo>? children})
      : super(
          NotificationDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationListScreen]
class NotificationListRoute extends PageRouteInfo<void> {
  const NotificationListRoute({List<PageRouteInfo>? children})
      : super(
          NotificationListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResetPwCertificationScreen]
class ResetPwCertificationRoute extends PageRouteInfo<void> {
  const ResetPwCertificationRoute({List<PageRouteInfo>? children})
      : super(
          ResetPwCertificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPwCertificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResetPwFormScreen]
class ResetPwFormRoute extends PageRouteInfo<void> {
  const ResetPwFormRoute({List<PageRouteInfo>? children})
      : super(
          ResetPwFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPwFormRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResetPwUpdateScreen]
class ResetPwUpdateRoute extends PageRouteInfo<void> {
  const ResetPwUpdateRoute({List<PageRouteInfo>? children})
      : super(
          ResetPwUpdateRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPwUpdateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchSchoolScreen]
class SearchSchoolRoute extends PageRouteInfo<void> {
  const SearchSchoolRoute({List<PageRouteInfo>? children})
      : super(
          SearchSchoolRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchSchoolRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
