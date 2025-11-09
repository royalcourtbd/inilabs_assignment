import 'package:get_it/get_it.dart';
import 'package:inilabs_assignment/core/di/setup/setup_module.dart';
import 'package:inilabs_assignment/core/services/error_message_handler.dart';

class ServiceSetup implements SetupModule {
  final GetIt _serviceLocator;
  ServiceSetup(this._serviceLocator);

  @override
  Future<void> setup() async {
    _serviceLocator.registerLazySingleton<ErrorMessageHandler>(
      ErrorMessageHandlerImpl.new,
    );
  }
}
