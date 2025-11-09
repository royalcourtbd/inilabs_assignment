import 'package:inilabs_assignment/core/base/base_export.dart';
import 'package:inilabs_assignment/core/services/error_message_handler.dart';
import 'package:inilabs_assignment/core/utility/trial_utility.dart';
import 'package:inilabs_assignment/features/home/data/datasource/home_remote_datasource.dart';
import 'package:inilabs_assignment/features/home/domain/entities/repository_entity.dart';
import 'package:inilabs_assignment/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  final ErrorMessageHandler _errorMessageHandler;

  HomeRepositoryImpl(this._remoteDataSource, this._errorMessageHandler);

  @override
  Future<Result<List<RepositoryEntity>>> getUserRepositories(
    String userName,
  ) async {
    try {
      // Using extension method for additional error safety
      final repositories = await this.catchAndReturnFuture(
        () => _remoteDataSource.getUserRepositories(userName),
      );

      if (repositories == null) {
        return left('Failed to fetch repositories');
      }

      final repositoryEntities = repositories
          .map((model) => model.toEntity())
          .toList();
      return right(repositoryEntities);
    } catch (error) {
      // Fallback error handling with custom error messages
      final errorMessage = _errorMessageHandler.generateErrorMessage(error);
      return left(errorMessage);
    }
  }
}
