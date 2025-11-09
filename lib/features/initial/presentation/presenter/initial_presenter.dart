import 'package:inilabs_assignment/core/base/base_export.dart';
import 'package:inilabs_assignment/core/utility/extensions.dart';
import 'package:inilabs_assignment/core/utility/navigation_helpers.dart';
import 'package:inilabs_assignment/core/utility/trial_utility.dart';
import 'package:inilabs_assignment/features/home/presentation/ui/home_page.dart';
import 'package:inilabs_assignment/features/initial/domain/usecase/get_user_profile_usecase.dart';
import 'package:inilabs_assignment/features/initial/presentation/presenter/initial_ui_state.dart';
import 'package:inilabs_assignment/shared/services/theme/theme_presenter.dart';

class InitialPresenter extends BasePresenter<InitialUiState> {
  final ThemePresenter _themePresenter;
  final GetUserProfileUseCase _getUserProfileUseCase;

  InitialPresenter(this._themePresenter, this._getUserProfileUseCase);

  final Obs<InitialUiState> uiState = Obs<InitialUiState>(
    InitialUiState.empty(),
  );
  InitialUiState get currentUiState => uiState.value;

  final TextEditingController textEditingController = TextEditingController();

  ThemePresenter get themePresenter => _themePresenter;

  Future<void> searchUser(BuildContext context) async {
    await catchFutureOrVoid(() async {
      final userName = textEditingController.text.trim();

      if (userName.isEmpty) {
        await addUserMessage('Please enter a username');
        return;
      }

      await toggleLoading(loading: true);

      final result = await _getUserProfileUseCase(userName);

      result.fold(
        (errorMessage) async {
          // Left - Error case
          await toggleLoading(loading: false);
          await addUserMessage(errorMessage);
        },
        (userData) async {
          // Right - Success case
          uiState.value = currentUiState.copyWith(
            userData: userData,
            isLoading: false,
          );
          await addUserMessage('User found: ${userData.login}');

          // Navigate to HomePage
          if (!context.mounted) return;
          context.navigatorPush(HomePage(userName: userData.login));
        },
      );
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
      textEditingController.dispose();
      super.dispose();
    });
  }
}
