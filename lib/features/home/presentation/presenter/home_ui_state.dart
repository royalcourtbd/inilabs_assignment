import 'package:inilabs_assignment/core/base/base_ui_state.dart';
import 'package:inilabs_assignment/features/home/domain/entities/repository_entity.dart';

/// Enum for view mode (ListView or GridView)
enum ViewMode { list, grid }

/// Enum for filter type
enum FilterType { name, date, stars, forks }

/// Enum for sort order
enum SortOrder { ascending, descending }

class HomeUiState extends BaseUiState {
  final List<RepositoryEntity> repositories;
  final List<RepositoryEntity> filteredRepositories;
  final String userName;
  final ViewMode viewMode;
  final FilterType filterType;
  final SortOrder sortOrder;

  const HomeUiState({
    required super.isLoading,
    required super.userMessage,
    required this.repositories,
    required this.filteredRepositories,
    required this.userName,
    required this.viewMode,
    required this.filterType,
    required this.sortOrder,
  });

  factory HomeUiState.empty() {
    return const HomeUiState(
      isLoading: false,
      userMessage: '',
      repositories: [],
      filteredRepositories: [],
      userName: '',
      viewMode: ViewMode.list,
      filterType: FilterType.name,
      sortOrder: SortOrder.ascending,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    userMessage,
    repositories,
    filteredRepositories,
    userName,
    viewMode,
    filterType,
    sortOrder,
  ];

  HomeUiState copyWith({
    bool? isLoading,
    String? userMessage,
    List<RepositoryEntity>? repositories,
    List<RepositoryEntity>? filteredRepositories,
    String? userName,
    ViewMode? viewMode,
    FilterType? filterType,
    SortOrder? sortOrder,
  }) {
    return HomeUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      repositories: repositories ?? this.repositories,
      filteredRepositories: filteredRepositories ?? this.filteredRepositories,
      userName: userName ?? this.userName,
      viewMode: viewMode ?? this.viewMode,
      filterType: filterType ?? this.filterType,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
