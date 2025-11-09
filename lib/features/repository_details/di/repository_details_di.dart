import 'package:inilabs_assignment/core/base/base_presenter.dart';
import 'package:inilabs_assignment/features/repository_details/data/repositories/repository_details_repository_impl.dart';
import 'package:inilabs_assignment/features/repository_details/domain/repositories/repository_details_repository.dart';
import 'package:inilabs_assignment/features/repository_details/presentation/presenter/repository_details_presenter.dart';

import 'package:get_it/get_it.dart';

class RepositoryDetailsDi {
  static Future<void> setup(GetIt serviceLocator) async {
    //  Data Source

    //  Repository
    serviceLocator.registerLazySingleton<RepositoryDetailsRepository>(
      () => RepositoryDetailsRepositoryImpl(),
    );

    // Use Cases

    // Presenters
    serviceLocator.registerFactory(
      () => loadPresenter(RepositoryDetailsPresenter()),
    );
  }
}
