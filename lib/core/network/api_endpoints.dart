/// GitHub API endpoints
class ApiEndpoints {
  ApiEndpoints._();

  /// Get user profile by username
  /// Example: /users/royalcourtbd
  static String getUserProfile(String userName) => "users/$userName";

  /// Get user repositories by username
  /// Example: /users/royalcourtbd/repos
  static String getUserRepos(String userName) => "users/$userName/repos";
}
