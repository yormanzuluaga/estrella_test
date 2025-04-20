import 'package:estrella_ui/estrella_ui.dart';
import 'package:flutter/material.dart';
import 'package:estrella_test/app/routes/routes.dart';
import 'package:estrella_test/l10n/l10n.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

/// {@template app}
/// The `App` class is a Dart class that represents the main application
/// and sets up the theme, localization, and routing.
/// {@endtemplate}

class App extends StatelessWidget {
  App({super.key});

  final router = CustomRouterConfig().router;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: const AppTheme().themeData,
      title: 'Pase de Guardia',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
    );
  }
}
