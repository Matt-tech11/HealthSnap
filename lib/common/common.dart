import 'package:intl/intl.dart';

String getTime(int value, {String formatStr = "hh:mm a"}) {
  var format = DateFormat(formatStr);
  return format.format(
    DateTime.fromMillisecondsSinceEpoch(value * 60 * 1000, isUtc: true),
  );
}

String getStringDateToOtherFormat(
  String dateStr, {
  String inputformatStr = "dd/MM/yyyy hh:mm aa",
  String outFormatStr = "hh:mm a",
}) {
  var format = DateFormat(outFormatStr);
  return format.format(stringToDate(dateStr, formatStr: inputformatStr));
}

DateTime stringToDate(String dateStr, {String formatStr = "hh:mm a"}) {
  var format = DateFormat(formatStr);
  return format.parse(dateStr);
}

DateTime dateToStartDate(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}

String dateToString(DateTime date, {String formatStr = "dd/MM/yyyy hh:mm a"}) {
  var format = DateFormat(formatStr);
  return format.format(date);
}

String getDayTitle(String dateStr, {String formatStr = "dd/MM/yyyy hh:mm a"}) {
  var date = stringToDate(dateStr, formatStr: formatStr);
  if (date.isToday) {
    return "Today";
  } else if (date.isTommorow) {
    return "Tommorow";
  } else if (date.isYesterday) {
    return "Yesterday";
  } else {
    var outFormat = DateFormat("E");
    return outFormat.format(date);
  }
}

extension DateHelpers on DateTime {
  bool get isToday {
    return DateTime(year, month, day).difference(DateTime.now()).inDays == 0;
  }

  bool get isYesterday {
    return DateTime(year, month, day).difference(DateTime.now()).inDays == -1;
  }

  bool get isTommorow {
    return DateTime(year, month, day).difference(DateTime.now()).inDays == -1;
  }
}
