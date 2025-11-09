import 'package:inilabs_assignment/core/external_libs/flutter_toast/toast_utility.dart';
import 'package:inilabs_assignment/core/utility/number_utility.dart';

Future<void> showMessage({String? message}) async {
  if (message == null || message.isEmpty) return;

  ToastUtility.showCustomToast(
    message: message,
    yOffset: 100.0,
    duration: 1000.inMilliseconds,
  );
}
