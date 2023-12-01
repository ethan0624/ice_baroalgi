import 'package:auto_route/auto_route.dart';

abstract class BlocEffect {
  factory BlocEffect.openSnackBar(String message) {
    return OpenSnackBarEffect(message);
  }

  factory BlocEffect.showAlert(
      {required title, String? message, Function? callback}) {
    return ShowAlertMessageEffect(
        title: title, message: message, callback: callback);
  }

  factory BlocEffect.push(PageRouteInfo route) {
    return PushRouteNavigateEffect(route);
  }

  factory BlocEffect.pushNamed(String path) {
    return PushNamedNavigateEffect(path);
  }

  factory BlocEffect.replace(PageRouteInfo route) {
    return ReplaceNavigateEffect(route);
  }

  factory BlocEffect.replaceNamed(String path) {
    return ReplaceNamedNavigateEffect(path);
  }

  factory BlocEffect.pop() {
    return const PopNavigateEffect();
  }
}

class OpenSnackBarEffect implements BlocEffect {
  final String message;
  const OpenSnackBarEffect(this.message);
}

class ShowToastEffect implements BlocEffect {
  final String message;
  const ShowToastEffect(this.message);
}

class ShowAlertMessageEffect implements BlocEffect {
  final String title;
  final String? message;
  final Function? callback;
  const ShowAlertMessageEffect(
      {required this.title, this.message, this.callback});
}

class PushRouteNavigateEffect implements BlocEffect {
  final PageRouteInfo route;
  const PushRouteNavigateEffect(this.route);
}

class PushNamedNavigateEffect implements BlocEffect {
  final String path;
  const PushNamedNavigateEffect(this.path);
}

class ReplaceNavigateEffect implements BlocEffect {
  final PageRouteInfo route;
  const ReplaceNavigateEffect(this.route);
}

class ReplaceNamedNavigateEffect implements BlocEffect {
  final String path;
  const ReplaceNamedNavigateEffect(this.path);
}

class PopNavigateEffect implements BlocEffect {
  const PopNavigateEffect();
}
