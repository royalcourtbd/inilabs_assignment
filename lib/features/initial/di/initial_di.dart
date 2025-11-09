import 'package:inilabs_assignment/core/base/base_presenter.dart';
import 'package:inilabs_assignment/features/initial/data/repositories/initial_repository_impl.dart';
import 'package:inilabs_assignment/features/initial/domain/repositories/initial_repository.dart';
import 'package:inilabs_assignment/features/initial/presentation/presenter/initial_presenter.dart';
import 'package:inilabs_assignment/shared/services/theme/theme_presenter.dart';

import 'package:get_it/get_it.dart';

class InitialDi {
  static Future<void> setup(GetIt serviceLocator) async {
    //  Data Source

    //  Repository
    serviceLocator.registerLazySingleton<InitialRepository>(
      () => InitialRepositoryImpl(),
    );

    // Presenters
    serviceLocator.registerFactory(() => loadPresenter(InitialPresenter()));

    // Theme Presenter - Registered as a Singleton
    serviceLocator.registerLazySingleton(() => loadPresenter(ThemePresenter()));
  }
}
