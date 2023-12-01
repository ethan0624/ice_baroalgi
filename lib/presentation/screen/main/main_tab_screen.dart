import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:incheon_knowhow/route/app_router.dart';
import 'package:incheon_knowhow/presentation/widget/app_bottom_navigation_bar.dart';

@RoutePage()
class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: Colors.white,
      routes: const [
        HomeRoute(),
        CourseRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return AppBottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTabPressed: (index) {
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
