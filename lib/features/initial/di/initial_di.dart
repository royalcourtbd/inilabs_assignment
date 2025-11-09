import 'package:inilabs_assignment/core/base/base_presenter.dart';
import 'package:inilabs_assignment/core/di/service_locator.dart';
import 'package:inilabs_assignment/core/network/api_client.dart';
import 'package:inilabs_assignment/core/services/error_message_handler.dart';
import 'package:inilabs_assignment/features/initial/data/datasource/initial_remote_datasource.dart';
import 'package:inilabs_assignment/features/initial/data/repositories/initial_repository_impl.dart';
import 'package:inilabs_assignment/features/initial/domain/repositories/initial_repository.dart';
import 'package:inilabs_assignment/features/initial/domain/usecase/get_user_profile_usecase.dart';
import 'package:inilabs_assignment/features/initial/presentation/presenter/initial_presenter.dart';
import 'package:inilabs_assignment/shared/services/theme/theme_presenter.dart';

import 'package:get_it/get_it.dart';

class InitialDi {
  static Future<void> setup(GetIt serviceLocator) async {
    // Data Source
    serviceLocator.registerLazySingleton<InitialRemoteDataSource>(
      () => InitialRemoteDataSourceImpl(locate<ApiClient>()),
    );

    // Repository
    serviceLocator.registerLazySingleton<InitialRepository>(
      () => InitialRepositoryImpl(
        locate<InitialRemoteDataSource>(),
        locate<ErrorMessageHandler>(),
      ),
    );

    // UseCase
    serviceLocator.registerLazySingleton<GetUserProfileUseCase>(
      () => GetUserProfileUseCase(
        locate<InitialRepository>(),
        locate<ErrorMessageHandler>(),
      ),
    );

    // Presenters
    serviceLocator.registerFactory(
      () => loadPresenter(
        InitialPresenter(
          locate<ThemePresenter>(),
          locate<GetUserProfileUseCase>(),
        ),
      ),
    );

    // Theme Presenter - Registered as a Singleton
    serviceLocator.registerLazySingleton(() => loadPresenter(ThemePresenter()));
  }
}
