import 'package:inilabs_assignment/core/network/api_client.dart';
import 'package:inilabs_assignment/core/network/api_endpoints.dart';
import 'package:inilabs_assignment/features/initial/data/models/user_model.dart';

/// Remote Data Source for Initial Feature

abstract class InitialRemoteDataSource {
  Future<UserModel> getUserProfile(String userName);
}

/// Implementation of InitialRemoteDataSource
class InitialRemoteDataSourceImpl implements InitialRemoteDataSource {
  final ApiClient _apiClient;

  InitialRemoteDataSourceImpl(this._apiClient);

  @override
  Future<UserModel> getUserProfile(String userName) async {
    final response = await _apiClient.get(
      endpoint: ApiEndpoints.getUserProfile(userName),
    );

    if (response == null) {
      throw Exception('Failed to fetch user profile: Response is null');
    }

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data as Map<String, dynamic>);
    } else {
      throw Exception(
        'Failed to fetch user profile: ${response.statusMessage}',
      );
    }
  }
}
