import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:estrella_test/app/routes/routes_names.dart';
import 'package:estrella_ui/estrella_ui.dart';

class MainDashboardDesktop extends StatelessWidget {
  const MainDashboardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppSpacing.md,
            ),
            Text(
              'Personajes',
              style: UITextStyle.titles.title2Medium,
            ),
            SizedBox(
              height: AppSpacing.md,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 52,
              child: AppButton.primary(
                onPressed: () {
                  context.go(RoutesNames.character);
                },
                title: 'Ver Personajes.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
