import 'package:inilabs_assignment/core/base/base_export.dart';
import 'package:inilabs_assignment/features/home/domain/entities/repository_entity.dart';

abstract class HomeRepository {
  Future<Result<List<RepositoryEntity>>> getUserRepositories(String userName);
}
