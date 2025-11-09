import 'package:inilabs_assignment/core/base/base_presenter.dart';
import 'package:inilabs_assignment/features/home/data/repositories/home_repository_impl.dart';
import 'package:inilabs_assignment/features/home/domain/repositories/home_repository.dart';
import 'package:inilabs_assignment/features/home/presentation/presenter/home_presenter.dart';

import 'package:get_it/get_it.dart';

class HomeDi {
  static Future<void> setup(GetIt serviceLocator) async {
    //  Data Source

    //  Repository
    serviceLocator.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(),
    );

    // Use Cases

    // Presenters
    serviceLocator.registerFactory(
      () => loadPresenter(HomePresenter()),
    );
  }
}
