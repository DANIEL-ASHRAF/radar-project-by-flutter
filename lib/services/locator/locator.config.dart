// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../auth.dart';
import '../firebase_realtime_database_service.dart';
import 'third_party_service_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServiceModule = _$ThirdPartyServiceModule();
  gh.lazySingleton<Auth>(() => Auth());
  gh.lazySingleton<DialogService>(() => thirdPartyServiceModule.dialogService);
  gh.lazySingleton<FirebaseRealtimeDatabaseService>(
      () => FirebaseRealtimeDatabaseService());
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServiceModule.navigationService);
  return get;
}

class _$ThirdPartyServiceModule extends ThirdPartyServiceModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
}