import 'package:all_ios_widgits/PWA/InkWellGesture.dart';
import 'package:all_ios_widgits/PWA/IosBottomPicker.dart';
import 'package:all_ios_widgits/PWA/TextFieldHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

/////////////////////////////////////////////////////////////////////////////////////////
class DatePickerSF extends StatefulWidget {
  final DateTime mili;
  final int finalDate;
  final Function timeSetter;
  final List<dynamic> condition;
  final String mHint;
  DatePickerSF(
      {Key key,
      this.mili,
      this.finalDate,
      this.timeSetter,
      this.condition,
      this.mHint})
      : super(key: key);

  @override
  _DatePickerSFState createState() =>
      _DatePickerSFState(mili, finalDate, timeSetter, condition, mHint);
}

class _DatePickerSFState extends State<DatePickerSF> {
  DateTime mili;
  int finalDate;
  Function timeSetter;
  List<dynamic> condition;
  String mHint;
  DateTime ax, temp;

  _DatePickerSFState(
      this.mili, this.finalDate, this.timeSetter, this.condition, this.mHint);

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (mili == null ||
        mili.year < DateTime.fromMillisecondsSinceEpoch(finalDate).year)
      mili = DateTime.now();
    return PlatformWidget(
        android: (_) => inkWellGesture(() async {
              var a = await showDatePicker(
                  context: context,
                  initialDate: mili,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.fromMillisecondsSinceEpoch(finalDate));
              if (a != null) {
                // print(a.hour);
                mili = DateTime(mili.year, mili.month, mili.day, 0, 0);
                setState(() {
                  ax = mili;
                });
                timeSetter(mili);
              }
            },
                child: TextFieldHelperDate(
                    time: ax, hint: mHint, isErrorString: condition)),
        ios: (_) => inkWellGesture(
            () => sometest(
                context,
                mili,
                (DateTime a) => {
                      mili = DateTime(
                          mili.year, mili.month, mili.day, a.hour, a.minute),
                      setState(() {
                        ax = mili;
                      }),
                      timeSetter(mili)
                    }),
            child: TextFieldHelperDate(
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

/////////////////////////////////////////////////////////////////////////////////////////
Widget DatePickerM({
  BuildContext context,
  DateTime mili,
  int finalDate,
  Function timeSetter,
  List<dynamic> condition,
  String mHint,
}) {
  FocusScope.of(context).requestFocus(new FocusNode());
  if (mili == null ||
      mili.year < DateTime.fromMillisecondsSinceEpoch(finalDate).year)
    mili = DateTime.now();
  DateTime ax;
  return PlatformWidget(
      android: (_) => inkWellGesture(() async {
            var a = await showDatePicker(
                context: context,
                initialDate: mili,
                firstDate: DateTime.now(),
                lastDate: DateTime.fromMillisecondsSinceEpoch(finalDate));
            if (a != null) {
              print(a.hour);
              mili = DateTime(mili.year, mili.month, mili.day, 0, 0);
              ax = mili;
              timeSetter(mili);
            }
          },
              child: TextFieldHelperDate(
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
          child: TextFieldHelperDate(
              time: ax, hint: mHint, isErrorString: condition)));
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

////////////////////////////////////////////////////////////////////////////////////////
Widget DatePickerWD(
    {BuildContext context,
    DateTime mili,
    int finalDate,
    Function timeSetter,
    Widget wd}) {
  FocusScope.of(context).requestFocus(new FocusNode());
  if (mili == null ||
      mili.year < DateTime.fromMillisecondsSinceEpoch(finalDate).year)
    mili = DateTime.now();
  return PlatformWidget(
      android: (_) => inkWellGesture(() async {
            var a = await showDatePicker(
                context: context,
                initialDate: mili,
                firstDate: DateTime.now(),
                lastDate: DateTime.fromMillisecondsSinceEpoch(finalDate));
            if (a != null) {
              //print(a.hour);
              timeSetter(DateTime(mili.year, mili.month, mili.day, 0, 0));
            }
          }, child: wd),
      ios: (_) => inkWellGesture(
          () => _sometest(
              context,
              mili,
              (DateTime a) => {
                    timeSetter(DateTime(
                        mili.year, mili.month, mili.day, a.hour, a.minute))
                  }),
          child: wd));
}

////////////////////////////////////////////////////////////////////////////////////////////
/*Widget PwaDatePicker(
    {BuildContext context,
    DateTime mili,
    int finalDate,
    @required Function timeSetter,
    @required Widget wd}) {

  if (mili == null ||
      mili.year < DateTime.fromMillisecondsSinceEpoch(finalDate).year)
    mili = DateTime.now();
  return 
}
*/

class PwaDatePicker extends StatelessWidget {
  final DateTime inlDate, fnlDate, firDate;
  final int nubDays;
  final Function timeSetter;
  final Widget wd;
  const PwaDatePicker(
      {Key key,
      this.inlDate,
      this.firDate,
      this.fnlDate,
      @required this.timeSetter,
      @required this.wd,
      this.nubDays})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    DateTime firstDate, //calander first date
        finalDate, // calander last date
        initalDate; // user sel date
    int x;
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
              var a = await showDatePicker(
                  context: context,
                  initialDate: initalDate,
                  firstDate: firstDate,
                  lastDate: finalDate);
              if (a != null) {
                timeSetter(DateTime(a.year, a.month, a.day, initalDate.hour,
                    initalDate.minute));
              }
            }, child: wd),
        ios: (_) => inkWellGesture(
            () => _cupertinoDatePoPup(
                context,
                initalDate,
                (DateTime a) => {
                      timeSetter(DateTime(a.year, a.month, a.day,
                          initalDate.hour, initalDate.minute))
                    }),
            child: wd));
  }

  _cupertinoDatePoPup(BuildContext context, DateTime mili, Function fn) {
    showCupertinoModalPopup<void>(
        context: context,
        //semanticsDismissible: true,
        builder: (BuildContext context) {
          return IosBottomPicker(
              child: CupertinoDatePicker(
                  backgroundColor:
                      CupertinoColors.systemBackground.resolveFrom(context),
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: mili,
                  onDateTimeChanged: fn));
        });
  }
}
