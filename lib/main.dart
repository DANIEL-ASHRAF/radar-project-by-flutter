// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radar_project_app/landing_page.dart';
import 'package:radar_project_app/services/locator/locator.dart';
import 'package:radar_project_app/services/routes/router.gr.dart'as r;
import 'package:stacked_services/stacked_services.dart';
import 'helper/common_widgets/dialog/custom_dialog_ui.dart';
import 'helper/constants/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  setupDialogUi();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = r.Router();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radar Project App',
      navigatorKey: StackedService.navigatorKey,
      theme: normalMode,
//initialRoute: r.LandingRoute.name,
      home: LandingPage(),
//      routerDelegate: _appRouter.delegate(navigatorKey: StackedService.navigatorKey),
//      routeInformationParser: _appRouter.defaultRouteParser(),
//      key: StackedService.navigatorKey,
    ) ;
  }
}