import 'package:inilabs_assignment/core/base/base_ui_state.dart';
import 'package:flutter/material.dart';

class ThemeUiState extends BaseUiState {
  final ThemeMode themeMode;
  final bool isDarkMode;

  const ThemeUiState({
    required super.isLoading,
    required super.userMessage,
    required this.themeMode,
    required this.isDarkMode,
  });

  factory ThemeUiState.empty() {
    return ThemeUiState(
      isLoading: false,
      userMessage: '',
      themeMode: ThemeMode.light,
      isDarkMode: false,
    );
  }

  @override
  List<Object?> get props => [isLoading, userMessage, themeMode, isDarkMode];

  ThemeUiState copyWith({
    bool? isLoading,
    String? userMessage,
    ThemeMode? themeMode,
    bool? isDarkMode,
  }) {
    return ThemeUiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
      themeMode: themeMode ?? this.themeMode,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
