import 'package:inilabs_assignment/core/base/base_export.dart';
import 'package:inilabs_assignment/features/initial/domain/entities/user_entity.dart';

abstract class InitialRepository {
  /// Get user profile by username
  Future<Result<UserEntity>> getUserProfile(String userName);
}
