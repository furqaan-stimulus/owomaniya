import 'package:injectable/injectable.dart';
import 'package:owomaniya/services/database_service.dart';
import 'package:owomaniya/services/network_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'authentication_service.dart';

@module
abstract class ThirdPartyServiceModule {
  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  AuthenticationService get authenticationService;

  @lazySingleton
  DataBaseService get databaseService;

  @lazySingleton
  DialogService get dialogService;

  @lazySingleton
  NetworkService get networkservice;
}
