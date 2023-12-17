import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/config/constrants.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/splash/bloc/splash_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _requestTrackingIfNeeded() async {
    if (await AppTrackingTransparency.trackingAuthorizationStatus ==
        TrackingStatus.notDetermined) {
      await AppTrackingTransparency.requestTrackingAuthorization();
    }

    await Future.delayed(AnimationDuration.medium);

    _onNext();
  }

  _onNext() {
    final bloc = _scaffoldKey.currentContext?.read<SplashBloc>();
    if (bloc == null) return;

    bloc.add(const SplashEvent.initial());
  }

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _requestTrackingIfNeeded();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<SplashBloc, SplashBloc, SplashState>(
      scaffoldKey: _scaffoldKey,
      create: (_) => SplashBloc(),
      backgroundColor: Colors.white,
      builder: (context, bloc, state) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Image.asset(
                'assets/images/app_logo.png',
                width: 200,
                height: 150,
                color: AppColor.primary,
              ),
              const Spacer(flex: 3),
            ],
          ),
        );
      },
    );
  }
}
