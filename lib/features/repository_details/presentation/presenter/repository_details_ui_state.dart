import 'package:inilabs_assignment/core/base/base_ui_state.dart';
import 'package:inilabs_assignment/features/home/domain/entities/repository_entity.dart';

class RepositoryDetailsUiState extends BaseUiState {
  final RepositoryEntity? repository;

  const RepositoryDetailsUiState({
    required super.isLoading,
    required super.userMessage,
    this.repository,
  });

  factory RepositoryDetailsUiState.empty() {
    return const RepositoryDetailsUiState(
      isLoading: false,
      userMessage: '',
      repository: null,
    );
  }

  @override
  List<Object?> get props => [isLoading, userMessage, repository];

  RepositoryDetailsUiState copyWith({
    bool? isLoading,
    String? userMessage,
    RepositoryEntity? repository,
  }) {
    return RepositoryDetailsUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      repository: repository ?? this.repository,
    );
  }
}
