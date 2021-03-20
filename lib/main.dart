// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Radar Project App',
      theme: ThemeData(
        primaryColor: bottomTabBarColor,
        accentColor: backgroundColor,
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: bottomTabBarColor,
            selectionHandleColor:brownColor
        ),
        scaffoldBackgroundColor: backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      key: locator<NavigationService>().navigatorKey,
    ) ;
  }
}