// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../view_models/radar_future_view_model.dart';
import '../auth.dart';
import '../firebase_realtime_database_service.dart';
import '../internet_connectivity.dart';

final locator = StackedLocator.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => Auth());
  locator.registerLazySingleton(() => FirebaseRealtimeDatabaseService());
  locator.registerLazySingleton(() => RadarFutureViewModel());
  locator.registerLazySingleton(() => ConnectivityService());
}
