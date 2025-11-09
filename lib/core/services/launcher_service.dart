import 'dart:io';
import 'package:inilabs_assignment/core/services/throttle_service.dart';

import 'package:inilabs_assignment/core/utility/logger_utility.dart';
import 'package:inilabs_assignment/core/utility/navigation_helpers.dart';
import 'package:inilabs_assignment/core/utility/number_utility.dart';
import 'package:inilabs_assignment/core/utility/trial_utility.dart';
import 'package:url_launcher/url_launcher.dart';

const String _fileName = "launcher_service.dart";

/// - provides a convenient way to open a URL asynchronously with an
/// optional fallback URL.
/// - utilizes the `Throttle` class to throttle multiple invocations
/// within a specified time interval, ensuring that the function is not called too frequently.
///
Future<void> openUrl({required String? url, String fallbackUrl = ""}) async {
  Throttle.throttle("openUrlThrottle", 1.inSeconds, () async {
    await catchFutureOrVoid(() async {
      if (url == null) return;
      if (url.trim().isEmpty) return;

      final Uri? uri = Uri.tryParse(url);
      final Uri? fallbackUri = Uri.tryParse(fallbackUrl);

      final bool validFallbackUri = fallbackUri != null;
      final bool validUri = uri != null;

      const String errorMessage = "Failed to open the URL";

      try {
        final bool canLaunch =
            validUri && (Platform.isAndroid || await canLaunchUrl(uri));

        if (canLaunch) {
          bool isLaunched = await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );
          if (isLaunched) return;

          isLaunched = await launchUrl(uri);
          if (isLaunched) return;
        }

        if (!validUri) {
          await showMessage(message: errorMessage);
          return;
        }

        validFallbackUri
            ? await launchUrl(fallbackUri, mode: LaunchMode.externalApplication)
            : await showMessage(message: errorMessage);
      } catch (e) {
        logErrorStatic(e, _fileName);
        validFallbackUri
            ? await launchUrl(fallbackUri)
            : await showMessage(message: errorMessage);
      }
    });
  });
}
