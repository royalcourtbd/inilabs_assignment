import 'package:get_it/get_it.dart';
import 'package:inilabs_assignment/core/di/setup/setup_module.dart';
import 'package:inilabs_assignment/core/network/api_client.dart';
import 'package:inilabs_assignment/core/services/error_message_handler.dart';
import 'package:inilabs_assignment/core/services/theme_service.dart';

class ServiceSetup implements SetupModule {
  final GetIt _serviceLocator;
  ServiceSetup(this._serviceLocator);

  @override
  Future<void> setup() async {
    // Register API Client
    _serviceLocator.registerLazySingleton<ApiClient>(() => ApiClient());

    // Register Error Message Handler
    _serviceLocator.registerLazySingleton<ErrorMessageHandler>(
      ErrorMessageHandlerImpl.new,
    );

    // Register Theme Service
    _serviceLocator.registerLazySingleton<ThemeService>(() => ThemeService());
  }
}
