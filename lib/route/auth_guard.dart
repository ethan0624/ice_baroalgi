import 'package:auto_route/auto_route.dart';
import 'package:incheon_knowhow/route/app_router.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';

class AuthGuard extends AutoRouteGuard {
  final _authProvider = getIt<AuthProvider>();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (_authProvider.isAuthenticated()) {
      resolver.next(true);
    } else {
      final isLogginedIn = await resolver.redirect<bool>(const LoginRoute());
      resolver.next(isLogginedIn == true);
    }
  }
}
