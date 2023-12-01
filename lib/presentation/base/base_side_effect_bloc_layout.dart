import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/presentation/base/base_layout.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_side_effect_consumer.dart';

class BaseSideEffectBlocLayout<SB extends SideEffectProvider<BlocEffect>,
    T extends BlocBase<S>, S extends BaseState> extends StatelessWidget {
  final Create<T> create;
  final Widget Function(BuildContext, T, S) builder;
  final Function(BuildContext, BlocEffect)? effectChanged;
  final Function(BuildContext, S)? stateChanged;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final AppBar? appBar;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool enabledBottomSafeArea;
  final bool resizeToAvoidBottomInset;

  const BaseSideEffectBlocLayout({
    super.key,
    required this.create,
    required this.builder,
    this.effectChanged,
    this.stateChanged,
    this.scaffoldKey,
    this.appBar,
    this.endDrawer,
    this.floatingActionButton,
    this.floatingActionButtonLocation = FloatingActionButtonLocation.endFloat,
    this.bottomNavigationBar,
    this.backgroundColor = Colors.white,
    this.enabledBottomSafeArea = true,
    this.resizeToAvoidBottomInset = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: create,
      child: LayoutBuilder(
        builder: (context, _) {
          final bloc = context.read<T>();
          return BaseLayout(
            key: scaffoldKey,
            appBar: appBar,
            endDrawer: endDrawer,
            floatingActionButtonLocation: floatingActionButtonLocation,
            floatingActionButton: floatingActionButton,
            bottomNavigationBar: bottomNavigationBar,
            backgroundColor: backgroundColor,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            child: BlocListener<T, S>(
              bloc: bloc,
              listener: (context, state) {
                stateChanged?.call(context, state);
              },
              child: BlocSideEffectConsumer<SB, T, S, BlocEffect>(
                listener: (context, effect) {
                  // 공통적인 effect 처리
                  if (effect is OpenSnackBarEffect) {
                    final snackBar = SnackBar(
                      content: Text(effect.message),
                      duration: const Duration(seconds: 1),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else if (effect is ShowAlertMessageEffect) {
                    // context
                    //     .showAlertDialog(
                    //         title: effect.title, message: effect.message)
                    //     .then((value) {
                    //   effect.callback != null && effect.callback!.call();
                    // });
                  } else if (effect is PushRouteNavigateEffect) {
                    context.router.push(effect.route);
                  } else if (effect is PushNamedNavigateEffect) {
                    context.router.pushNamed(effect.path);
                  } else if (effect is ReplaceNamedNavigateEffect) {
                    context.router.replaceNamed(effect.path);
                  } else if (effect is ReplaceNavigateEffect) {
                    context.router.replace(effect.route);
                  } else if (effect is PopNavigateEffect) {
                    context.router.pop();
                  }
                  effectChanged?.call(context, effect);
                },
                builder: (context, state) {
                  return Stack(
                    children: [
                      builder(context, bloc, state),
                      // loading
                      // Offstage(
                      //   offstage: !state.isLoading,
                      //   child: Container(
                      //     width: double.infinity,
                      //     height: double.infinity,
                      //     color: Colors.grey.withOpacity(0.4),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         const CircularProgressIndicator(
                      //           strokeWidth: 2,
                      //         ),
                      //         Padding(
                      //           padding:
                      //               const EdgeInsets.symmetric(vertical: 20),
                      //           child: Text(
                      //             '데이터 로딩중입니다..',
                      //             style: AppTheme.textStyle.body01,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
