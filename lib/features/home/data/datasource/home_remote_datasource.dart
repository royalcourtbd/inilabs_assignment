import 'package:inilabs_assignment/core/network/api_client.dart';
import 'package:inilabs_assignment/core/network/api_endpoints.dart';
import 'package:inilabs_assignment/features/home/data/models/repository_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<RepositoryModel>> getUserRepositories(String userName);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient _apiClient;

  HomeRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<RepositoryModel>> getUserRepositories(String userName) async {
    final response = await _apiClient.get(
      endpoint: ApiEndpoints.getUserRepos(userName),
    );

    if (response == null) {
      throw Exception('Failed to fetch repositories: Response is null');
    }

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = response.data as List<dynamic>;
      return jsonList
          .map((json) => RepositoryModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
        'Failed to fetch repositories: ${response.statusMessage}',
      );
    }
  }
}
