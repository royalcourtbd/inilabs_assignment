import 'dart:async';
import 'package:inilabs_assignment/core/base/base_presenter.dart';
import 'package:inilabs_assignment/core/utility/navigation_helpers.dart';
import 'package:inilabs_assignment/features/initial/presentation/presenter/initial_ui_state.dart';

class InitialPresenter extends BasePresenter<InitialUiState> {
  final Obs<InitialUiState> uiState = Obs<InitialUiState>(InitialUiState.empty());
  InitialUiState get currentUiState => uiState.value;

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
