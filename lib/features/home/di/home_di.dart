import 'package:inilabs_assignment/core/base/base_presenter.dart';
import 'package:inilabs_assignment/core/network/api_client.dart';
import 'package:inilabs_assignment/core/services/error_message_handler.dart';
import 'package:inilabs_assignment/features/home/data/datasource/home_remote_datasource.dart';
import 'package:inilabs_assignment/features/home/data/repositories/home_repository_impl.dart';
import 'package:inilabs_assignment/features/home/domain/repositories/home_repository.dart';
import 'package:inilabs_assignment/features/home/domain/usecase/get_user_repositories_usecase.dart';
import 'package:inilabs_assignment/features/home/presentation/presenter/home_presenter.dart';

import 'package:get_it/get_it.dart';

class HomeDi {
  static Future<void> setup(GetIt serviceLocator) async {
    //  Data Source
    serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(serviceLocator<ApiClient>()),
    );

    //  Repository
    serviceLocator.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        serviceLocator<HomeRemoteDataSource>(),
        serviceLocator<ErrorMessageHandler>(),
      ),
    );

    // Use Cases
    serviceLocator.registerLazySingleton<GetUserRepositoriesUseCase>(
      () => GetUserRepositoriesUseCase(
        serviceLocator<HomeRepository>(),
        serviceLocator<ErrorMessageHandler>(),
      ),
    );

    // Presenters
    serviceLocator.registerFactory(
      () => loadPresenter(
        HomePresenter(serviceLocator<GetUserRepositoriesUseCase>()),
      ),
    );
  }
}
