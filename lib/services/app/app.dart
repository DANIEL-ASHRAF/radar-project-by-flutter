import 'package:radar_project_app/landing_page.dart';
import 'package:radar_project_app/view_models/radar_future_view_model.dart';
import 'package:radar_project_app/views/launcher_view.dart';
import 'package:radar_project_app/views/radar_view.dart';
import 'package:radar_project_app/views/reset_password_view.dart';
import 'package:radar_project_app/views/sign_in_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../auth.dart';
import '../firebase_realtime_database_service.dart';


@StackedApp(
  routes: [
    MaterialRoute(page: LandingPage, initial: true),
    MaterialRoute(page: SignInView),
    MaterialRoute(page: RadarView),
    MaterialRoute(page: LauncherView),
    MaterialRoute(page: ResetPasswordView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: Auth),
    LazySingleton(classType: FirebaseRealtimeDatabaseService),
    LazySingleton(classType: RadarFutureViewModel)
  ]
)
class AppSetup {}