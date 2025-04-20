import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:estrella_test/app/routes/routes_names.dart';

import 'package:estrella_test/feature/home/view/home_page.dart';
import 'package:estrella_test/feature/character/widgets/detail.dart';
import 'package:estrella_test/feature/main_dashboard/view/main_dashboard_page.dart';
import 'package:estrella_test/feature/character/view/character_page.dart';
import 'package:estrella_ui/estrella_ui.dart';

part 'router_handlers.dart';

/// Navigator keys
final healthNavigatorKey = GlobalKey<NavigatorState>();
final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeNavigatorKey = GlobalKey<NavigatorState>();

/// The `managementNavigatorKey` is a global key that is used to access the
/// management navigator.
final managementNavigatorKey = GlobalKey<NavigatorState>();

/// The rootScaffoldMessengerKey is a global key that is used to access the
/// rootScaffold navigator.
final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class CustomRouterConfig {
  static final _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: RoutesNames.home,
    errorPageBuilder: (context, state) {
      return NoTransitionPage(
        child: UnderConstruction(title: state.matchedLocation),
      );
    },
    routes: [
      /// Main ShellRoute for authenticated users
      ShellRoute(
        navigatorKey: homeNavigatorKey,
        builder: _homeHandler,
        routes: [
          /// Home route
          GoRoute(
            path: RoutesNames.home,
            parentNavigatorKey: homeNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: MainDashboardPage(),
              );
            },
          ),
          ShellRoute(
            parentNavigatorKey: homeNavigatorKey,
            navigatorKey: healthNavigatorKey,
            pageBuilder: (context, state, child) {
              return NoTransitionPage(child: child);
            },
            routes: [
              // Web version
              GoRoute(
                path: RoutesNames.character,
                parentNavigatorKey: healthNavigatorKey,
                pageBuilder: _characterPageHandler,
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: RoutesNames.detail,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: _detailPageHandler,
      ),

      /// Nested routes (shared structure for both health and management)
    ],
  );

  /// Expose the router instance
  GoRouter get router => _router;
}

/// Pop until a specific path
void popUntilPath(String routePath, BuildContext context) {
  final router = GoRouter.of(context);
  while ('${router.routeInformationProvider.value.uri}' != routePath) {
    if (!router.canPop()) return;
    router.pop();
  }
}
