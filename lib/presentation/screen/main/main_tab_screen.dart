import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/route/app_router.dart';
import 'package:incheon_knowhow/presentation/widget/app_bottom_navigation_bar.dart';

@RoutePage()
class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  final _authProvider = getIt<AuthProvider>();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!_authProvider.skipJinroAccountRegist) {
        context.router.pushNamed('/jinroAccount');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: Colors.white,
      routes: const [
        HomeRoute(),
        MyCourseRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return AppBottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTabPressed: (index) async {
            if (index == 1) {
              context.checkLoginOrRequestLogin(onLoggedIn: () {
                tabsRouter.setActiveIndex(index);
              });
              return;
            }
            if (index == 2) {
              context.router.pushNamed('/mypage');
              return;
            }
            tabsRouter.setActiveIndex(index);
          },
        );
      },
    );
  }
}
