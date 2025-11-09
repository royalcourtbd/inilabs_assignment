import 'package:inilabs_assignment/core/base/base_export.dart';
import 'package:inilabs_assignment/core/services/error_message_handler.dart';
import 'package:inilabs_assignment/core/utility/trial_utility.dart';
import 'package:inilabs_assignment/features/initial/domain/entities/user_entity.dart';
import 'package:inilabs_assignment/features/initial/domain/repositories/initial_repository.dart';

/// UseCase for getting user profile from GitHub

class GetUserProfileUseCase extends BaseUseCase<UserEntity> {
  final InitialRepository _repository;

  GetUserProfileUseCase(
    this._repository,
    ErrorMessageHandler errorMessageHandler,
  ) : super(errorMessageHandler);

  Future<Result<UserEntity>> call(String userName) async {
    if (userName.trim().isEmpty) {
      return left('Username cannot be empty');
    }

    final result = await this.catchAndReturnFuture(
      () => _repository.getUserProfile(userName),
    );

    if (result == null) {
      return left('Failed to get user profile');
    }

    return result;
  }
}
