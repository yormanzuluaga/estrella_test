import 'package:flutter/material.dart';
import 'package:estrella_ui/estrella_ui.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: child,
    );
  }
}
