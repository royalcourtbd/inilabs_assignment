import 'package:inilabs_assignment/core/base/base_ui_state.dart';
import 'package:inilabs_assignment/features/initial/domain/entities/user_entity.dart';

class InitialUiState extends BaseUiState {
  final UserEntity? userData;

  const InitialUiState({
    required super.isLoading,
    required super.userMessage,
    this.userData,
  });

  factory InitialUiState.empty() {
    return const InitialUiState(
      isLoading: false,
      userMessage: '',
      userData: null,
    );
  }

  @override
  List<Object?> get props => [isLoading, userMessage, userData];

  InitialUiState copyWith({
    bool? isLoading,
    String? userMessage,
    UserEntity? userData,
  }) {
    return InitialUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      userData: userData ?? this.userData,
    );
  }
}
