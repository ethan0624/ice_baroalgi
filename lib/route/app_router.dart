import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/domain/model/certification_code.dart';
import 'package:incheon_knowhow/domain/model/push.dart';
import 'package:incheon_knowhow/domain/model/school.dart';
import 'package:incheon_knowhow/presentation/screen/account/account_screen.dart';
import 'package:incheon_knowhow/presentation/screen/business/business_screen.dart';
import 'package:incheon_knowhow/presentation/screen/certification/certification_result.dart';
import 'package:incheon_knowhow/presentation/screen/certification/certification_screen.dart';
import 'package:incheon_knowhow/presentation/screen/course/info/course_info_screen.dart';
import 'package:incheon_knowhow/presentation/screen/course/map/course_map_screen.dart';
import 'package:incheon_knowhow/presentation/screen/cscenter/qna/cscenter_qna_screen.dart';
import 'package:incheon_knowhow/presentation/screen/favorite_course/favorite_course_screen.dart';
import 'package:incheon_knowhow/presentation/screen/cscenter/inquiry/inquiry_screen.dart';
import 'package:incheon_knowhow/presentation/screen/my_course/my_course_screen.dart';
import 'package:incheon_knowhow/presentation/screen/find_id/find_id_screen.dart';
import 'package:incheon_knowhow/presentation/screen/home/home_screen.dart';
import 'package:incheon_knowhow/presentation/screen/jinro_account/jinro_account_screen.dart';
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
import 'package:incheon_knowhow/presentation/screen/pw_verify/verify_pw_screen.dart';
import 'package:incheon_knowhow/presentation/screen/reset_pw/certification/reset_pw_certification_screen.dart';
import 'package:incheon_knowhow/presentation/screen/reset_pw/form/reset_pw_form_screen.dart';
import 'package:incheon_knowhow/presentation/screen/reset_pw/update/reset_pw_update_screen.dart';
import 'package:incheon_knowhow/presentation/screen/search/search_screen.dart';
import 'package:incheon_knowhow/presentation/screen/search_school/search_school_screen.dart';
import 'package:incheon_knowhow/presentation/screen/splash/splash_screen.dart';
import 'package:incheon_knowhow/presentation/screen/spot_detail/spot_detail_screen.dart';
import 'package:incheon_knowhow/presentation/screen/stamp_regist/stamp_regist_screen.dart';
import 'package:incheon_knowhow/presentation/screen/update_school/update_school_screen.dart';
import 'package:incheon_knowhow/presentation/screen/withdraw/withdraw_screen.dart';
import 'package:incheon_knowhow/route/auth_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final _authGuard = AuthGuard();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SplashRoute.page, initial: true),
        AutoRoute(path: '/login', page: LoginRoute.page),

        // 회원가입
        AutoRoute(path: '/join', page: JoinUserTypeRoute.page),
        AutoRoute(path: '/join/agreement', page: JoinAgreementRoute.page),
        AutoRoute(path: '/join/user', page: JoinUserInfoRoute.page),
        AutoRoute(
            path: '/join/certification', page: JoinCertificationRoute.page),
        AutoRoute(path: '/join/regist', page: JoinRegistRoute.page),
        AutoRoute(path: '/join/complete', page: JoinCompleteRoute.page),

        // 비밀번호 재설정
        AutoRoute(path: '/resetPw', page: ResetPwFormRoute.page),
        AutoRoute(
            path: '/resetPw/certification',
            page: ResetPwCertificationRoute.page),
        AutoRoute(path: '/resetPw/update', page: ResetPwUpdateRoute.page),

        AutoRoute(path: '/findId', page: FindIdRoute.page),
        AutoRoute(path: '/certification', page: CertificationRoute.page),

        // 메인
        AutoRoute(
          path: '/main',
          page: MainTabRoute.page,
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page, initial: true),
            AutoRoute(
              path: 'myCourse',
              page: MyCourseRoute.page,
              guards: [_authGuard],
            ),
          ],
        ),

        AutoRoute(path: '/favoriteCourse', page: FavoriteCourseRoute.page),

        AutoRoute(path: '/course/:courseId/map', page: CourseMapRoute.page),
        AutoRoute(path: '/course/:courseId/info', page: CourseInfoRoute.page),

        AutoRoute(path: '/spot/:spotId', page: SpotDetailRoute.page),

        AutoRoute(path: '/stamp/regist', page: StampRegistRoute.page),

        AutoRoute(path: '/search', page: SearchRoute.page),

        // 알림
        AutoRoute(path: '/notification', page: NotificationListRoute.page),
        AutoRoute(
          path: '/notification/:id',
          page: NotificationDetailRoute.page,
        ),

        // 설정
        AutoRoute(path: '/mypage', page: MypageRoute.page),
        AutoRoute(path: '/account', page: AccountRoute.page),
        AutoRoute(path: '/language', page: LanguageRoute.page),
        AutoRoute(path: '/notice', page: NoticeRoute.page),
        AutoRoute(path: '/business', page: BusinessRoute.page),
        AutoRoute(path: '/cscenter/qna', page: CscenterQnaRoute.page),
        AutoRoute(path: '/cscenter/inquiry', page: InquiryRoute.page),
        AutoRoute(path: '/searchSchool', page: SearchSchoolRoute.page),
        AutoRoute(path: '/update/school', page: UpdateSchoolRoute.page),
        AutoRoute(path: '/jinroAccount', page: JinroAccountRoute.page),
        AutoRoute(path: '/verify/pw', page: VerifyPwRoute.page),
        AutoRoute(path: '/withdraw', page: WithdrawRoute.page),
      ];
}
