// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/authentication_service.dart';
import '../services/database_service.dart';
import '../services/network_service.dart';
import '../services/third_party_service_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServiceModule = _$ThirdPartyServiceModule();
  gh.lazySingleton<AuthenticationService>(
      () => thirdPartyServiceModule.authenticationService);
  gh.lazySingleton<DataBaseService>(
      () => thirdPartyServiceModule.databaseService);
  gh.lazySingleton<DialogService>(() => thirdPartyServiceModule.dialogService);
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServiceModule.navigationService);
  gh.lazySingleton<NetworkService>(
      () => thirdPartyServiceModule.networkservice);
  return get;
}

class _$ThirdPartyServiceModule extends ThirdPartyServiceModule {
  @override
  AuthenticationService get authenticationService => AuthenticationService();
  @override
  DataBaseService get databaseService => DataBaseService();
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  NetworkService get networkservice => NetworkService();
}
