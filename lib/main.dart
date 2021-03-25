// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:radar_project_app/services/app/app.locator.dart';
import 'package:radar_project_app/services/app/app.router.dart';
import 'package:radar_project_app/services/internet_connectivity.dart';
import 'package:stacked_services/stacked_services.dart';
import 'helper/common_widgets/dialog/custom_dialog_ui.dart';
import 'helper/constants/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  setupDialogUi();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
      initialData: ConnectivityStatus.WiFi,
      create:(context)=>ConnectivityService().stream ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Radar Project App',
        navigatorKey: StackedService.navigatorKey,
        theme: normalMode,
        initialRoute: Routes.landingPage,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      ),
    );
  }
}