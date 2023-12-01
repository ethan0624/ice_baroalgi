import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final AppBar? appBar;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool enabledBottomSafeArea;
  final bool resizeToAvoidBottomInset;

  const BaseLayout({
    super.key,
    required this.child,
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
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      endDrawer: endDrawer,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: SafeArea(
        top: false,
        bottom: enabledBottomSafeArea,
        child: child,
      ),
    );
  }
}
