import 'dart:async';
import 'dart:developer';

import 'package:estrella_test/flavor.dart';

import 'app/view/app.dart';
import 'injection/injection_container.dart' as di;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Bootstrap is responsible for any common setup and calls
/// [runApp] with the widget returned by [builder] in an error zone.
Future<void> bootstrap({
  required FlavorType flavor,
}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  await runZonedGuarded(() async {
    Flavor.instance.setFlavor = flavor;
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    await di.init(
      onError: (exception, stack) {},
    );

    runApp(App());
  }, onError);
}

onError(Object exception, StackTrace stackTrace) {}
