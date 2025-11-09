import 'package:inilabs_assignment/core/base/base_ui_state.dart';

class InitialUiState extends BaseUiState {
  const InitialUiState({required super.isLoading, required super.userMessage});

  factory InitialUiState.empty() {
    return InitialUiState(isLoading: false, userMessage: '');
  }

  @override
  List<Object?> get props => [isLoading, userMessage];

  //Add more properties to the state

  InitialUiState copyWith({bool? isLoading, String? userMessage}) {
    return InitialUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
    );
  }
}
