// Utility extension for converting numbers to Duration
extension DurationExtensions on num {
  Duration get inMilliseconds => Duration(milliseconds: round());

  Duration get inSeconds => Duration(seconds: round());

  Duration get inMinutes =>
      Duration(seconds: (this * Duration.secondsPerMinute).round());

  Duration get inHours =>
      Duration(minutes: (this * Duration.minutesPerHour).round());

  Duration get inDays => Duration(hours: (this * Duration.hoursPerDay).round());
}
