import 'package:inilabs_assignment/core/base/base_export.dart';
import 'package:inilabs_assignment/core/di/service_locator.dart';
import 'package:inilabs_assignment/core/services/theme_service.dart';
import 'package:inilabs_assignment/shared/services/theme/theme_ui_state.dart';

class ThemePresenter extends BasePresenter<ThemeUiState> {
  // ThemeService instance
  final ThemeService _themeService = locate<ThemeService>();

  final Obs<ThemeUiState> uiState = Obs<ThemeUiState>(ThemeUiState.empty());

  ThemeUiState get currentUiState => uiState.value;

  /// Current theme mode getter
  ThemeMode get currentThemeMode => _themeService.themeMode;

  bool get isDarkMode => _themeService.isDarkMode;

  @override
  void onInit() {
    super.onInit();
    _updateUiState();
  }

  /// Theme toggle method
  void toggleTheme() {
    _themeService.toggleTheme();
    _updateUiState();
  }

  /// Specific theme mode set method
  void setThemeMode(ThemeMode mode) {
    _themeService.setThemeMode(mode);
    _updateUiState();
  }

  /// Light theme activate method
  void setLightTheme() {
    _themeService.setLightMode();
    _updateUiState();
  }

  /// Dark theme activate method
  void setDarkTheme() {
    _themeService.setDarkMode();
    _updateUiState();
  }

  /// UI state update private method
  void _updateUiState() {
    uiState.value = currentUiState.copyWith(
      themeMode: _themeService.themeMode,
      isDarkMode: _themeService.isDarkMode,
    );
  }

  @override
  Future<void> addUserMessage(String message) async {
    uiState.value = currentUiState.copyWith(userMessage: message);
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    uiState.value = currentUiState.copyWith(isLoading: loading);
  }
}
