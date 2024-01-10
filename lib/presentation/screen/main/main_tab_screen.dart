import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/presentation/widget/custom_map_marker.dart';
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
  bool _isAuthenticated = false;

  _handleAuthChanged() {
    final authenticated = _authProvider.isAuthenticated();
    if (_isAuthenticated != authenticated) {
      _isAuthenticated = authenticated;

      if (!authenticated) {
        context.router.navigateNamed('/main/home');
      }
    }
  }

  _loadMapMarker() async {
    await Future.wait([
      NOverlayImage.fromWidget(
        widget: const CustomMapMarker(),
        size: const Size(36, 44),
        context: context,
      ),
      NOverlayImage.fromWidget(
        widget: const CustomMapMarker(
          isFocus: true,
        ),
        size: const Size(36, 44),
        context: context,
      ),
      NOverlayImage.fromWidget(
        widget: const CustomMapMarker(
          type: CustomMapMarkerType.completed,
        ),
        size: const Size(36, 44),
        context: context,
      ),
      NOverlayImage.fromWidget(
        widget: const CustomMapMarker(
          type: CustomMapMarkerType.completed,
          isFocus: true,
        ),
        size: const Size(36, 44),
        context: context,
      )
    ]);
  }

  @override
  void initState() {
    super.initState();

    _authProvider.addListener(_handleAuthChanged);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _isAuthenticated = _authProvider.isAuthenticated();

      if (!_authProvider.skipJinroAccountRegist) {
        context.router.pushNamed('/jinroAccount');
      }

      _loadMapMarker();
    });
  }

  @override
  void dispose() {
    _authProvider.removeListener(_handleAuthChanged);
    super.dispose();
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
