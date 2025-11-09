import 'package:inilabs_assignment/core/base/base_ui_state.dart';

class RepositoryDetailsUiState extends BaseUiState {
  const RepositoryDetailsUiState({required super.isLoading, required super.userMessage});

  factory RepositoryDetailsUiState.empty() {
    return RepositoryDetailsUiState(isLoading: false, userMessage: '');
  }

  @override
  List<Object?> get props => [isLoading, userMessage];

  //Add more properties to the state

  RepositoryDetailsUiState copyWith({bool? isLoading, String? userMessage}) {
    return RepositoryDetailsUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
    );
  }
}
