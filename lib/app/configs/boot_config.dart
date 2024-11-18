import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:tdd_test/app/configs/boot_settings.dart';
import 'package:tdd_test/core/domain/domain_export.dart';

import 'app_config.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function(BootSettings? bootSettings)? builder,
) async {
  FlutterError.onError = (details) {
    debugPrint("==============detail $details");
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      await dotenv.load();
      appConfig.loadData(dotenv.env);

      ServiceLocator().init(appConfig: appConfig);

      BootSettings bootSettings = BootSettings();

      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      if (builder != null) runApp(await builder(bootSettings));
    },
    (error, stackTrace) async {
      Logger().e('App Error', error: error, stackTrace: stackTrace);
    },
  );
}
