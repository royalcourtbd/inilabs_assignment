import 'dart:async';
import 'package:inilabs_assignment/core/base/base_presenter.dart';
import 'package:inilabs_assignment/core/utility/navigation_helpers.dart';
import 'package:inilabs_assignment/features/repository_details/presentation/presenter/repository_details_ui_state.dart';

class RepositoryDetailsPresenter extends BasePresenter<RepositoryDetailsUiState> {
  final Obs<RepositoryDetailsUiState> uiState = Obs<RepositoryDetailsUiState>(RepositoryDetailsUiState.empty());
  RepositoryDetailsUiState get currentUiState => uiState.value;

  @override
  Future<void> addUserMessage(String message) async {
    uiState.value = currentUiState.copyWith(userMessage: message);
    showMessage(message: currentUiState.userMessage);
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    uiState.value = currentUiState.copyWith(isLoading: loading);
  }
}
