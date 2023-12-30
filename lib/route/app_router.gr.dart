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
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountScreen(),
      );
    },
    BusinessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BusinessScreen(),
      );
    },
    CertificationRoute.name: (routeData) {
      return AutoRoutePage<CertificationResult>(
        routeData: routeData,
        child: const CertificationScreen(),
      );
    },
    CourseInfoRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseInfoRouteArgs>(
          orElse: () =>
              CourseInfoRouteArgs(courseId: pathParams.getInt('courseId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CourseInfoScreen(
          key: args.key,
          courseId: args.courseId,
        ),
      );
    },
    CourseMapRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseMapRouteArgs>(
          orElse: () =>
              CourseMapRouteArgs(courseId: pathParams.getInt('courseId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CourseMapScreen(
          key: args.key,
          courseId: args.courseId,
        ),
      );
    },
    CscenterQnaRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CscenterQnaScreen(),
      );
    },
    FavoriteCourseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoriteCourseScreen(),
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
    InquiryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InquiryScreen(),
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
      return AutoRoutePage<bool>(
        routeData: routeData,
        child: const LoginScreen(),
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
      final args = routeData.argsAs<NotificationDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationDetailScreen(
          key: args.key,
          push: args.push,
        ),
      );
    },
    NotificationListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationListScreen(),
      );
    },
    ResetPwCertificationRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPwCertificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResetPwCertificationScreen(
          key: args.key,
          certificationCode: args.certificationCode,
        ),
      );
    },
    ResetPwFormRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPwFormScreen(),
      );
    },
    ResetPwUpdateRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<ResetPwUpdateRouteArgs>(
          orElse: () =>
              ResetPwUpdateRouteArgs(userId: queryParams.optInt('userId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResetPwUpdateScreen(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    SearchSchoolRoute.name: (routeData) {
      return AutoRoutePage<School>(
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
    SpotDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SpotDetailScreen(),
      );
    },
  };
}

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BusinessScreen]
class BusinessRoute extends PageRouteInfo<void> {
  const BusinessRoute({List<PageRouteInfo>? children})
      : super(
          BusinessRoute.name,
          initialChildren: children,
        );

  static const String name = 'BusinessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [CourseInfoScreen]
class CourseInfoRoute extends PageRouteInfo<CourseInfoRouteArgs> {
  CourseInfoRoute({
    Key? key,
    required int courseId,
    List<PageRouteInfo>? children,
  }) : super(
          CourseInfoRoute.name,
          args: CourseInfoRouteArgs(
            key: key,
            courseId: courseId,
          ),
          rawPathParams: {'courseId': courseId},
          initialChildren: children,
        );

  static const String name = 'CourseInfoRoute';

  static const PageInfo<CourseInfoRouteArgs> page =
      PageInfo<CourseInfoRouteArgs>(name);
}

class CourseInfoRouteArgs {
  const CourseInfoRouteArgs({
    this.key,
    required this.courseId,
  });

  final Key? key;

  final int courseId;

  @override
  String toString() {
    return 'CourseInfoRouteArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [CourseMapScreen]
class CourseMapRoute extends PageRouteInfo<CourseMapRouteArgs> {
  CourseMapRoute({
    Key? key,
    required int courseId,
    List<PageRouteInfo>? children,
  }) : super(
          CourseMapRoute.name,
          args: CourseMapRouteArgs(
            key: key,
            courseId: courseId,
          ),
          rawPathParams: {'courseId': courseId},
          initialChildren: children,
        );

  static const String name = 'CourseMapRoute';

  static const PageInfo<CourseMapRouteArgs> page =
      PageInfo<CourseMapRouteArgs>(name);
}

class CourseMapRouteArgs {
  const CourseMapRouteArgs({
    this.key,
    required this.courseId,
  });

  final Key? key;

  final int courseId;

  @override
  String toString() {
    return 'CourseMapRouteArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [CscenterQnaScreen]
class CscenterQnaRoute extends PageRouteInfo<void> {
  const CscenterQnaRoute({List<PageRouteInfo>? children})
      : super(
          CscenterQnaRoute.name,
          initialChildren: children,
        );

  static const String name = 'CscenterQnaRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoriteCourseScreen]
class FavoriteCourseRoute extends PageRouteInfo<void> {
  const FavoriteCourseRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteCourseRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteCourseRoute';

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
/// [InquiryScreen]
class InquiryRoute extends PageRouteInfo<void> {
  const InquiryRoute({List<PageRouteInfo>? children})
      : super(
          InquiryRoute.name,
          initialChildren: children,
        );

  static const String name = 'InquiryRoute';

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
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
class NotificationDetailRoute
    extends PageRouteInfo<NotificationDetailRouteArgs> {
  NotificationDetailRoute({
    Key? key,
    required Push push,
    List<PageRouteInfo>? children,
  }) : super(
          NotificationDetailRoute.name,
          args: NotificationDetailRouteArgs(
            key: key,
            push: push,
          ),
          initialChildren: children,
        );

  static const String name = 'NotificationDetailRoute';

  static const PageInfo<NotificationDetailRouteArgs> page =
      PageInfo<NotificationDetailRouteArgs>(name);
}

class NotificationDetailRouteArgs {
  const NotificationDetailRouteArgs({
    this.key,
    required this.push,
  });

  final Key? key;

  final Push push;

  @override
  String toString() {
    return 'NotificationDetailRouteArgs{key: $key, push: $push}';
  }
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
class ResetPwCertificationRoute
    extends PageRouteInfo<ResetPwCertificationRouteArgs> {
  ResetPwCertificationRoute({
    Key? key,
    required CertificationCode certificationCode,
    List<PageRouteInfo>? children,
  }) : super(
          ResetPwCertificationRoute.name,
          args: ResetPwCertificationRouteArgs(
            key: key,
            certificationCode: certificationCode,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPwCertificationRoute';

  static const PageInfo<ResetPwCertificationRouteArgs> page =
      PageInfo<ResetPwCertificationRouteArgs>(name);
}

class ResetPwCertificationRouteArgs {
  const ResetPwCertificationRouteArgs({
    this.key,
    required this.certificationCode,
  });

  final Key? key;

  final CertificationCode certificationCode;

  @override
  String toString() {
    return 'ResetPwCertificationRouteArgs{key: $key, certificationCode: $certificationCode}';
  }
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
class ResetPwUpdateRoute extends PageRouteInfo<ResetPwUpdateRouteArgs> {
  ResetPwUpdateRoute({
    Key? key,
    int? userId,
    List<PageRouteInfo>? children,
  }) : super(
          ResetPwUpdateRoute.name,
          args: ResetPwUpdateRouteArgs(
            key: key,
            userId: userId,
          ),
          rawQueryParams: {'userId': userId},
          initialChildren: children,
        );

  static const String name = 'ResetPwUpdateRoute';

  static const PageInfo<ResetPwUpdateRouteArgs> page =
      PageInfo<ResetPwUpdateRouteArgs>(name);
}

class ResetPwUpdateRouteArgs {
  const ResetPwUpdateRouteArgs({
    this.key,
    this.userId,
  });

  final Key? key;

  final int? userId;

  @override
  String toString() {
    return 'ResetPwUpdateRouteArgs{key: $key, userId: $userId}';
  }
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

/// generated route for
/// [SpotDetailScreen]
class SpotDetailRoute extends PageRouteInfo<void> {
  const SpotDetailRoute({List<PageRouteInfo>? children})
      : super(
          SpotDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpotDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
