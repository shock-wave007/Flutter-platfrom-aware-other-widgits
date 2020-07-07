import 'package:all_ios_widgits/PWA/TimeModifer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

Widget TextFieldHelperTime(
    {DateTime time, String hint, List<dynamic> isErrorString}) {
  //print("TextFieldHelperTime " + time.toString());
  return PlatformTextField(
      textAlign: TextAlign.center,
      controller: TextEditingController(text: dateTimeToTimeString(time)),
      android: (_) => MaterialTextFieldData(
          decoration: InputDecoration(
              hintText: hint,
              errorText: isErrorString != null
                  ? (isErrorString[0] ? isErrorString[1] : null)
                  : null)),
      ios: (_) => CupertinoTextFieldData(placeholder: hint));
}

Widget TextFieldHelperDate(
    {DateTime time, String hint, List<dynamic> isErrorString}) {
  //print("TextFieldHelperDate " + time.toString());
  return PlatformTextField(
      textAlign: TextAlign.center,
      controller: TextEditingController(text: dateTimeToTimeString(time)),
      android: (_) => MaterialTextFieldData(
          decoration: InputDecoration(
              hintText: hint,
              errorText: isErrorString[0] ? isErrorString[1] : null)),
      ios: (_) => CupertinoTextFieldData(placeholder: hint));
}

Widget TextFieldHelperDateTime(
    {DateTime time, String hint, List<dynamic> isErrorString, bool isTime}) {
  //print("TextFieldHelperDate " + time.toString());
  var tempFun;
  if (isTime == null) {
    if (hint == null) hint = "Date Time";
    tempFun = dateTimeToDateTimeString(time);
  } else if (isTime) {
    if (hint == null) hint = "Time";
    tempFun = dateTimeToTimeString(time);
  } else {
    if (hint == null) hint = "Date";
    tempFun = dateTimeToDateString(time);
  }
  return PlatformTextField(
      textAlign: TextAlign.center,
      controller: TextEditingController(text: tempFun),
      android: (_) => MaterialTextFieldData(
          decoration: InputDecoration(
              hintText: hint,
              errorText: isErrorString[0] ? isErrorString[1] : null)),
      ios: (_) => CupertinoTextFieldData(placeholder: hint));
}
