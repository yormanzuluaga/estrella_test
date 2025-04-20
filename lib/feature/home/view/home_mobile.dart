import 'package:flutter/material.dart';

import 'package:estrella_ui/estrella_ui.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({
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
