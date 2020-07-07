import 'package:all_ios_widgits/PWA/InkWellGesture.dart';
import 'package:all_ios_widgits/PWA/IosBottomPicker.dart';
import 'package:all_ios_widgits/PWA/TimeModifer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

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
  bool temp = isErrorString != null && isErrorString[0];
  return PlatformWidget(
      cupertino: (_, __) => Column(children: <Widget>[
            PlatformTextField(
                textAlign: TextAlign.center,
                controller: TextEditingController(text: tempFun),
                ios: (_) => CupertinoTextFieldData(
                    placeholder: hint,
                    decoration: temp
                        ? BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.0,
                                    color: CupertinoColors.systemRed)))
                        : BoxDecoration())),
            temp
                ? PlatformText(isErrorString[1],
                    style: TextStyle(
                        fontSize: 12, color: CupertinoColors.systemRed))
                : Container()
          ]),
      material: (_, __) => PlatformTextField(
            textAlign: TextAlign.center,
            controller: TextEditingController(text: tempFun),
            android: (_) => MaterialTextFieldData(
                decoration: InputDecoration(
                    hintText: hint,
                    errorText: isErrorString[0] ? isErrorString[1] : null)),
          ));
}

cupertinoDatePoPup(
    {BuildContext context,
    DateTime initalDate,
    Function fn,
    DateTime finalDate,
    DateTime firstDate,
    bool isTime}) {
  var mMode;
  isTime == null
      ? mMode = CupertinoDatePickerMode.dateAndTime
      : isTime
          ? mMode = CupertinoDatePickerMode.time
          : mMode = CupertinoDatePickerMode.date;
  showCupertinoModalPopup<void>(
      context: context,
      //semanticsDismissible: true,
      builder: (BuildContext context) {
        return IosBottomPicker(
            child: CupertinoDatePicker(
                backgroundColor:
                    CupertinoColors.systemBackground.resolveFrom(context),
                mode: mMode,
                maximumDate: finalDate,
                minimumDate: firstDate,
                initialDateTime: initalDate,
                onDateTimeChanged: fn));
      });
}

class PwaDateTimePicker extends StatelessWidget {
  final DateTime inlDate, fnlDate, firDate;
  final int nubDays;
  final Function timeSetter;
  final bool isTime;
  final List<dynamic> isError;
  final String hint;
  static const List<dynamic> isErroa = [false, ""];
  PwaDateTimePicker(
      {Key key,
      this.inlDate,
      this.firDate,
      this.fnlDate,
      this.isTime,
      this.nubDays,
      @required this.timeSetter,
      this.isError = isErroa,
      this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    DateTime firstDate, //calander first date
        finalDate, // calander last date
        initalDate; // user sel date
    int x;

    var a, b, c;

    nubDays == null ? x = 7 : x = nubDays;

    inlDate == null //user sel date
        ? initalDate = DateTime.now()
        : initalDate = inlDate;
    firDate == null
        ? firstDate = DateTime.fromMillisecondsSinceEpoch(0) //cal first date
        : firstDate = firDate;
    fnlDate == null
        ? finalDate = DateTime.now().add(Duration(days: x)) // cal final date
        : finalDate = fnlDate;

    return PlatformWidget(
        android: (_) => inkWellGesture(() async {
              if (isTime == null || isTime) {
                a = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(initalDate),
                );
                if (a == null) return;
              }
              if (isTime == null || !isTime) {
                b = await showDatePicker(
                    context: context,
                    initialDate: initalDate,
                    firstDate: firstDate,
                    lastDate: finalDate);
                if (b == null) return;
              }
              isTime == null
                  ? c = DateTime(b.year, b.month, b.day, a.hour, a.minute)
                  : isTime
                      ? c = DateTime(initalDate.year, initalDate.month,
                          initalDate.day, a.hour, a.minute)
                      : c = DateTime(b.year, b.month, b.day, initalDate.hour,
                          initalDate.minute);
              timeSetter(c);
            },
                child: TextFieldHelperDateTime(
                    time: inlDate,
                    isErrorString: isError,
                    isTime: isTime,
                    hint: hint)),
        ios: (_) => inkWellGesture(
            () => cupertinoDatePoPup(
                context: context,
                initalDate: initalDate,
                fn: (DateTime a) => {
                      isTime == null
                          ? c =
                              DateTime(a.year, a.month, a.day, a.hour, a.minute)
                          : isTime
                              ? c = DateTime(initalDate.year, initalDate.month,
                                  initalDate.day, a.hour, a.minute)
                              : c = DateTime(a.year, a.month, a.day,
                                  initalDate.hour, initalDate.minute),
                      timeSetter(c)
                    },
                finalDate: finalDate,
                firstDate: firstDate),
            child: TextFieldHelperDateTime(
                time: inlDate,
                isErrorString: isError,
                isTime: isTime,
                hint: hint)));
  }
}
