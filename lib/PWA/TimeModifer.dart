import 'package:intl/intl.dart';

String timeStampToTimeString(double time, {bool is24}) {
  return time != null && time != 0
      ? DateFormat("hh:mm a")
          .format(DateTime.fromMillisecondsSinceEpoch(time.toInt()))
          .toString()
      : "";
}

String dateTimeToTimeString(DateTime time, {bool is24}) {
  return time != null && time.millisecondsSinceEpoch != 0
      ? DateFormat("hh:mm a").format(time).toString()
      : "";
}

///////////////////////////////////////////////////////////////////////////////////////////////
String timeStampToDateString(double time, {bool is24}) {
  return time != null &&
          time == DateTime(1970, 01, 01) &&
          time != DateTime.now().millisecondsSinceEpoch
      ? DateFormat("dd/MMM/yyyy")
          .format(DateTime.fromMillisecondsSinceEpoch(time.toInt()))
          .toString()
      : "";
}

String dateTimeToDateString(DateTime time, {bool is24}) {
  return time != null &&
          time.millisecondsSinceEpoch != 0 &&
          time != DateTime.now()
      ? DateFormat("dd/MMM/yyyy").format(time).toString()
      : "";
}
///////////////////////////////////////////////////////////////////////////////////////////////

String timeStampToDateTimeString(double time, {bool is24}) {
  return time != null &&
          time != 0 &&
          time != DateTime.now().millisecondsSinceEpoch
      ? DateFormat("dd/MMM/yyyy hh:mm")
          .format(DateTime.fromMillisecondsSinceEpoch(time.toInt()))
          .toString()
      : "";
}

String dateTimeToDateTimeString(DateTime time, {bool is24}) {
  return time != null &&
          time.millisecondsSinceEpoch != 0 &&
          time != DateTime.now()
      ? DateFormat("dd/MMM/yyyy hh:mm a").format(time).toString()
      : "";
}
