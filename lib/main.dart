import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'core/app_component/app_component.dart';
import 'core/routes/router.dart';
import 'core/status/status.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
var internetCheck = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await init();
  runZonedGuarded(() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      runApp(const MyApp());
    });
  }, (error, stackTrace) {
    logger
        .e('runZonedGuarded: Caught error in my root zone. $error $stackTrace');
    if (!kDebugMode) {}
  });
}

final box = GetStorage();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ThemeServices _ts = ThemeServices();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zatiq Task',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: RouteGenerator.onRouteGenerate,
    );
  }
}
