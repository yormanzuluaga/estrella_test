// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:showcaseview/showcaseview.dart';
import 'package:estrella_test/feature/home/view/home_desktop.dart';
import 'package:estrella_test/feature/home/view/home_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      disableBarrierInteraction: true,
      scrollDuration: const Duration(milliseconds: 5),
      disableMovingAnimation: true,
      enableAutoScroll: MediaQuery.of(context).size.height >= 700,
      builder: (_) => HomeView(
        child: child,
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: LayoutBuilder(
        builder: (context, constraints) {
          return MediaQuery.of(context).size.width > 900 ? HomeDesktop(child: child) : HomeMobile(child: child);
        },
      ),
    );
  }
}
