import 'package:inilabs_assignment/core/base/base_export.dart';
import 'package:inilabs_assignment/core/services/error_message_handler.dart';
import 'package:inilabs_assignment/core/utility/trial_utility.dart';
import 'package:inilabs_assignment/features/home/domain/entities/repository_entity.dart';
import 'package:inilabs_assignment/features/home/domain/repositories/home_repository.dart';

class GetUserRepositoriesUseCase extends BaseUseCase<List<RepositoryEntity>> {
  final HomeRepository _repository;

  GetUserRepositoriesUseCase(
    this._repository,
    ErrorMessageHandler errorMessageHandler,
  ) : super(errorMessageHandler);

  Future<Result<List<RepositoryEntity>>> call(String userName) async {
    if (userName.trim().isEmpty) {
      return left('Username cannot be empty');
    }

    final result = await this.catchAndReturnFuture(
      () => _repository.getUserRepositories(userName),
    );

    if (result == null) {
      return left('Failed to get repositories');
    }

    return result;
  }
}
