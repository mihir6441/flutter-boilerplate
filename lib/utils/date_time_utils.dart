import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static final _formatBirthDate = DateFormat('dd/MM/yyyy');
  static final _formatBirthDateForServer = DateFormat('yyyy-MM-dd');
  static final _formatOverviewBirthDate = DateFormat('dd, MMM yyyy');
  static final _formatDateTime = DateFormat('yyyy-MM-dd hh:mm:ss');
  static final _formatDisplayDate = DateFormat('MMM dd, yyyy');

  static String formatBirthDate(DateTime? date) {
    if (date == null) return '';
    return _formatBirthDate.format(date);
  }

  static String formatBirthDateForServer(DateTime? date) {
    if (date == null) return '';
    return Intl.withLocale('en', () => _formatBirthDateForServer.format(date));
  }

  static DateTime? parseBirthDateFromServer(String? dateOfBirth) {
    if (dateOfBirth == null) return null;
    return Intl.withLocale('en', () => _formatBirthDate.parse(dateOfBirth));
  }

  static String formatBirthDateFromServer(String? dateOfBirth) {
    if (dateOfBirth == null) return '';
    final dateTime =
        Intl.withLocale('en', () => _formatBirthDate.parse(dateOfBirth));
    return _formatOverviewBirthDate.format(dateTime);
  }

  static String? formatBirthDateUserToServer(String? dateOfBirth) {
    if (dateOfBirth == null) return null;
    final dateTime =
        Intl.withLocale('en', () => _formatBirthDate.parse(dateOfBirth));
    return _formatBirthDateForServer.format(dateTime);
  }

  static String formatDisplayDate(DateTime? date) {
    if (date == null) return '';
    return _formatDisplayDate.format(date);
  }

  static String calculateDifference(String? dateTimeString) {
   // if (date == null) return '';
    var currentTime = DateTime.now();
    var diff =DateTime.now().difference(DateTime.parse(dateTimeString!));
    return diff.inHours.toString();
  }
}
