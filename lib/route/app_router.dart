import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/presentation/screen/certification/certification_result.dart';
import 'package:incheon_knowhow/presentation/screen/certification/certification_screen.dart';
import 'package:incheon_knowhow/presentation/screen/course/course_screen.dart';
import 'package:incheon_knowhow/presentation/screen/find_id/find_id_screen.dart';
import 'package:incheon_knowhow/presentation/screen/home/home_screen.dart';
import 'package:incheon_knowhow/presentation/screen/join/agreement/join_agreement_screen.dart';
import 'package:incheon_knowhow/presentation/screen/join/certification/join_certification_screen.dart';
import 'package:incheon_knowhow/presentation/screen/join/complete/join_complete_screen.dart';
import 'package:incheon_knowhow/presentation/screen/join/join_data.dart';
import 'package:incheon_knowhow/presentation/screen/join/regist/join_regist_screen.dart';
import 'package:incheon_knowhow/presentation/screen/join/user_info/join_user_info_screen.dart';
import 'package:incheon_knowhow/presentation/screen/join/user_type/join_user_type_screen.dart';
import 'package:incheon_knowhow/presentation/screen/language/language_screen.dart';
import 'package:incheon_knowhow/presentation/screen/login/login_screen.dart';
import 'package:incheon_knowhow/presentation/screen/main/main_tab_screen.dart';
import 'package:incheon_knowhow/presentation/screen/mypage/mypage_screen.dart';
import 'package:incheon_knowhow/presentation/screen/notice/notice_screen.dart';
import 'package:incheon_knowhow/presentation/screen/notification/detail/notification_detail_screen.dart';
import 'package:incheon_knowhow/presentation/screen/notification/list/notification_list_screen.dart';
import 'package:incheon_knowhow/presentation/screen/reset_pw/reset_pw_screen.dart';
import 'package:incheon_knowhow/presentation/screen/splash/splash_screen.dart';
import 'package:incheon_knowhow/route/auth_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final _authGuard = AuthGuard();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SplashRoute.page, initial: true),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/findId', page: FindIdRoute.page),
        AutoRoute(path: '/resetPw', page: ResetPwRoute.page),
        AutoRoute(path: '/certification', page: CertificationRoute.page),
        AutoRoute(path: '/join', page: JoinUserTypeRoute.page),
        AutoRoute(path: '/join/agreement', page: JoinAgreementRoute.page),
        AutoRoute(path: '/join/user', page: JoinUserInfoRoute.page),
        AutoRoute(
            path: '/join/certification', page: JoinCertificationRoute.page),
        AutoRoute(path: '/join/regist', page: JoinRegistRoute.page),
        AutoRoute(path: '/join/complete', page: JoinCompleteRoute.page),
        AutoRoute(
          path: '/main',
          page: MainTabRoute.page,
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page, initial: true),
            AutoRoute(path: 'course', page: CourseRoute.page),
          ],
        ),
        AutoRoute(path: '/mypage', page: MypageRoute.page),
        AutoRoute(path: '/notification', page: NotificationListRoute.page),
        AutoRoute(
          path: '/notification/:id',
          page: NotificationDetailRoute.page,
        ),
        AutoRoute(path: '/language', page: LanguageRoute.page),
        AutoRoute(path: '/notice', page: NoticeRoute.page),
      ];
}
