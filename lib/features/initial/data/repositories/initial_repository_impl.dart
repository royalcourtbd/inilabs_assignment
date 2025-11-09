import 'package:inilabs_assignment/core/base/base_export.dart';
import 'package:inilabs_assignment/core/services/error_message_handler.dart';
import 'package:inilabs_assignment/core/utility/trial_utility.dart';
import 'package:inilabs_assignment/features/initial/data/datasource/initial_remote_datasource.dart';
import 'package:inilabs_assignment/features/initial/domain/entities/user_entity.dart';
import 'package:inilabs_assignment/features/initial/domain/repositories/initial_repository.dart';

/// Implementation of InitialRepository
/// Handles data operations and error handling
class InitialRepositoryImpl implements InitialRepository {
  final InitialRemoteDataSource _remoteDataSource;
  final ErrorMessageHandler _errorMessageHandler;

  InitialRepositoryImpl(this._remoteDataSource, this._errorMessageHandler);

  @override
  Future<Result<UserEntity>> getUserProfile(String userName) async {
    try {
      // Using extension method for additional error safety
      final userModel = await this.catchAndReturnFuture(
        () => _remoteDataSource.getUserProfile(userName),
      );

      if (userModel == null) {
        return left('Failed to fetch user profile');
      }

      final userEntity = userModel.toEntity();
      return right(userEntity);
    } catch (error) {
      // Fallback error handling with custom error messages
      final errorMessage = _errorMessageHandler.generateErrorMessage(error);
      return left(errorMessage);
    }
  }
}
