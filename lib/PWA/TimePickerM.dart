import 'package:all_ios_widgits/PWA/InkWellGesture.dart';
import 'package:all_ios_widgits/PWA/IosBottomPicker.dart';
import 'package:all_ios_widgits/PWA/TextFieldHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

////////////////////////////////////////////////////////////////////////////////////////////
class TimePickerSF extends StatefulWidget {
  // BuildContext context;
  final DateTime mili;
  final Function timeSetter;
  final List<dynamic> condition;
  final String mHint;
  TimePickerSF(
      {Key key, this.mili, this.timeSetter, this.condition, this.mHint})
      : super(key: key);

  @override
  _TimePickerSFState createState() =>
      _TimePickerSFState(mili, timeSetter, condition, mHint);
}

class _TimePickerSFState extends State<TimePickerSF> {
  DateTime mili;
  Function timeSetter;
  List<dynamic> condition;
  String mHint;
  DateTime ax, temp;
  _TimePickerSFState(this.mili, this.timeSetter, this.condition, this.mHint);

  @override
  Widget build(BuildContext context) {
    print("TimePickerSF mili" + mili.toString());
    FocusScope.of(context).requestFocus(new FocusNode());
    if (mili == null) mili = DateTime.now();
    temp = mili;
    return PlatformWidget(
        android: (_) => inkWellGesture(() async {
              var a = await showTimePicker(
                  context: context, initialTime: TimeOfDay.fromDateTime(mili));
              if (a != null) {
                mili =
                    DateTime(temp.year, temp.month, temp.day, a.hour, a.minute);
                setState(() {
                  ax = mili;
                });
                timeSetter(mili);
              }
            },
                child: TextFieldHelperTime(
                    time: ax, hint: mHint, isErrorString: condition)),
        ios: (_) => inkWellGesture(
            () => sometest(
                context,
                mili,
                (DateTime a) => {
                      mili = DateTime(
                          mili.year, mili.month, mili.day, a.hour, a.minute),
                      ax = mili,
                      setState(() {
                        ax = mili;
                      }),
                      timeSetter(mili)
                    }),
            child: TextFieldHelperTime(
                time: ax, hint: mHint, isErrorString: condition)));
  }

  sometest(BuildContext context, DateTime mili, Function fn) {
    showCupertinoModalPopup<void>(
        context: context,
        //semanticsDismissible: true,
        builder: (BuildContext context) {
          return IosBottomPicker(
              child: CupertinoDatePicker(
                  backgroundColor:
                      CupertinoColors.systemBackground.resolveFrom(context),
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: mili,
                  onDateTimeChanged: fn));
        });
  }
}

////////////////////////////////////////////////////////////////////////////////////////////
Widget TimePickerM({
  @required BuildContext context,
  DateTime mili,
  Function timeSetter,
  List<dynamic> condition,
  String mHint,
}) {
  FocusScope.of(context).requestFocus(new FocusNode());
  if (mili == null) mili = DateTime.now();
  DateTime ax;
  return PlatformWidget(
      android: (_) => inkWellGesture(() async {
            var a = await showTimePicker(
                context: context, initialTime: TimeOfDay.fromDateTime(mili));
            if (a != null) {
              print(a.hour);
              mili =
                  DateTime(mili.year, mili.month, mili.day, a.hour, a.minute);
              ax = mili;
              timeSetter(mili);
            }
          },
              child: TextFieldHelperTime(
                  time: mili, hint: mHint, isErrorString: condition)),
      ios: (_) => inkWellGesture(
          () => _sometest(
              context,
              mili,
              (DateTime a) => {
                    mili = DateTime(
                        mili.year, mili.month, mili.day, a.hour, a.minute),
                    ax = mili,
                    timeSetter(mili)
                  }),
          child: TextFieldHelperTime(
              time: mili, hint: mHint, isErrorString: condition)));
}

_sometest(BuildContext context, DateTime mili, Function fn) {
  showCupertinoModalPopup<void>(
      context: context,
      //semanticsDismissible: true,
      builder: (BuildContext context) {
        return IosBottomPicker(
            child: CupertinoDatePicker(
                backgroundColor:
                    CupertinoColors.systemBackground.resolveFrom(context),
                mode: CupertinoDatePickerMode.time,
                initialDateTime: mili,
                onDateTimeChanged: fn));
      });
}
////////////////////////////////////////////////////////////////////////////////////////////

Widget TimePickerWD({
  @required BuildContext context,
  Widget wd,
  DateTime mili,
  Function timeSetter,
}) {
  FocusScope.of(context).requestFocus(new FocusNode());
  if (mili == null) mili = DateTime.now();
  return PlatformWidget(
      android: (_) => inkWellGesture(() async {
            var a = await showTimePicker(
                context: context, initialTime: TimeOfDay.fromDateTime(mili));
            if (a != null)
              timeSetter(
                  DateTime(mili.year, mili.month, mili.day, a.hour, a.minute));
          }, child: wd),
      ios: (_) => inkWellGesture(
          () => _sometest(
              context,
              mili,
              (DateTime a) => {
                    mili = DateTime(
                        mili.year, mili.month, mili.day, a.hour, a.minute),
                    timeSetter(mili)
                  }),
          child: wd));
}

////////////////////////////////////////////////////////////////////////////////////////////
class PwaTimePicker extends StatelessWidget {
  final Function timeSetter;
  final DateTime mDateTime;
  final Widget wd;
  const PwaTimePicker(
      {Key key, @required this.timeSetter, this.mDateTime, @required this.wd})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime mili =
        mDateTime != null ? mDateTime : DateTime.fromMillisecondsSinceEpoch(0);
    FocusScope.of(context).requestFocus(new FocusNode());
    return PlatformWidget(
        android: (_) => inkWellGesture(() async {
              var a = await showTimePicker(
                  context: context, initialTime: TimeOfDay.fromDateTime(mili));
              if (a != null)
                timeSetter(DateTime(
                    mili.year, mili.month, mili.day, a.hour, a.minute));
            }, child: wd),
        ios: (_) => inkWellGesture(
            () => _sometest(
                context,
                mili,
                (DateTime a) => {
                      mili = DateTime(
                          mili.year, mili.month, mili.day, a.hour, a.minute),
                      timeSetter(mili)
                    }),
            child: wd));
  }
}
