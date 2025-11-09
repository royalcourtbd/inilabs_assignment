import 'dart:async';
import 'package:inilabs_assignment/core/base/base_presenter.dart';
import 'package:inilabs_assignment/core/utility/navigation_helpers.dart';
import 'package:inilabs_assignment/core/utility/trial_utility.dart';
import 'package:inilabs_assignment/features/home/domain/entities/repository_entity.dart';
import 'package:inilabs_assignment/features/home/domain/usecase/get_user_repositories_usecase.dart';
import 'package:inilabs_assignment/features/home/presentation/presenter/home_ui_state.dart';

class HomePresenter extends BasePresenter<HomeUiState> {
  final GetUserRepositoriesUseCase _getUserRepositoriesUseCase;

  HomePresenter(this._getUserRepositoriesUseCase);

  final Obs<HomeUiState> uiState = Obs<HomeUiState>(HomeUiState.empty());
  HomeUiState get currentUiState => uiState.value;

  /// Initialize with username
  Future<void> initialize(String userName) async {
    await catchFutureOrVoid(() async {
      uiState.value = currentUiState.copyWith(userName: userName);
      await fetchRepositories();
    });
  }

  /// Fetch repositories
  Future<void> fetchRepositories() async {
    await catchFutureOrVoid(() async {
      await toggleLoading(loading: true);

      final result = await _getUserRepositoriesUseCase(currentUiState.userName);

      result.fold(
        (errorMessage) async {
          // Left - Error case
          await toggleLoading(loading: false);
          await addUserMessage(errorMessage);
        },
        (repositories) async {
          // Right - Success case
          uiState.value = currentUiState.copyWith(
            repositories: repositories,
            filteredRepositories: repositories,
            isLoading: false,
          );
          _applyFilterAndSort();
          await addUserMessage('Found ${repositories.length} repositories');
        },
      );
    });
  }

  /// Toggle between ListView and GridView
  Future<void> toggleViewMode() async {
    await catchFutureOrVoid(() async {
      final newMode = currentUiState.viewMode == ViewMode.list
          ? ViewMode.grid
          : ViewMode.list;
      uiState.value = currentUiState.copyWith(viewMode: newMode);
    });
  }

  /// Change filter type
  Future<void> changeFilterType(FilterType filterType) async {
    await catchFutureOrVoid(() async {
      uiState.value = currentUiState.copyWith(filterType: filterType);
      _applyFilterAndSort();
    });
  }

  /// Toggle sort order
  Future<void> toggleSortOrder() async {
    await catchFutureOrVoid(() async {
      final newOrder = currentUiState.sortOrder == SortOrder.ascending
          ? SortOrder.descending
          : SortOrder.ascending;
      uiState.value = currentUiState.copyWith(sortOrder: newOrder);
      _applyFilterAndSort();
    });
  }

  /// Apply filter and sort to repositories
  void _applyFilterAndSort() {
    catchVoid(() {
      List<RepositoryEntity> filtered = List.from(currentUiState.repositories);

      switch (currentUiState.filterType) {
        case FilterType.name:
          filtered.sort((a, b) => a.name.compareTo(b.name));
          break;
        case FilterType.date:
          filtered.sort((a, b) => a.createdAt.compareTo(b.createdAt));
          break;
        case FilterType.stars:
          filtered.sort(
            (a, b) => a.stargazersCount.compareTo(b.stargazersCount),
          );
          break;
        case FilterType.forks:
          filtered.sort((a, b) => a.forksCount.compareTo(b.forksCount));
          break;
      }

      // Apply sort order
      if (currentUiState.sortOrder == SortOrder.descending) {
        filtered = filtered.reversed.toList();
      }

      uiState.value = currentUiState.copyWith(filteredRepositories: filtered);
    });
  }

  @override
  Future<void> addUserMessage(String message) async {
    await catchFutureOrVoid(() async {
      uiState.value = currentUiState.copyWith(userMessage: message);
      showMessage(message: currentUiState.userMessage);
    });
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    await catchFutureOrVoid(() async {
      uiState.value = currentUiState.copyWith(isLoading: loading);
    });
  }

  @override
  void dispose() {
    catchVoid(() {
      super.dispose();
    });
  }
}
