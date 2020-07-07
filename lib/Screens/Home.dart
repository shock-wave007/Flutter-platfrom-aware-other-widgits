import 'dart:math';

import 'package:all_ios_widgits/PWA/PwaContextMenu.dart';
import 'package:all_ios_widgits/PWA/PwaDateTimePicker.dart';
import 'package:all_ios_widgits/PWA/PwaRadioGrpSegment.dart';
import 'package:all_ios_widgits/PWA/TimeModifer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String res = "";
  dynamic mREs;
  DateTime mTime, mDate, mDateTime;

  _switchPlatform(BuildContext context) {
    if (isMaterial(context)) {
      PlatformProvider.of(context).changeToCupertinoPlatform();
    } else {
      PlatformProvider.of(context).changeToMaterialPlatform();
    }
  }

  _updatePwaRadioGrpSEG(dynamic val) {
    setState(() {
      mREs = val;
    });
  }

  _updateRes(String s) {
    setState(() {
      res = s;
    });
  }

  _updateTime(var value) {
    setState(() {
      mTime = value;
    });
  }

  _updateDate(var value) {
    setState(() {
      mDate = value;
    });
  }

  _updateDateTime(var value) {
    setState(() {
      mDateTime = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(title: PlatformText("All Ios Widget")),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
              SizedBox(width: double.infinity),
              PlatformText("Result : " + (mREs == null ? "" : mREs.toString())),
              PlatformButton(
                child: PlatformText('Switch Platform'),
                onPressed: () => _switchPlatform(context),
              ),
              PlatformText(
                  'Verify ur Vampire. \nWhat kind of light Vampier Like?'),
              PwaRadioGrpSegment(
                strList: ["SunLight", "MoonLight", "NoLight"],
                fn: (a) => _updatePwaRadioGrpSEG(a),
                cVal: mREs,
              ),
              Row(children: <Widget>[
                Expanded(
                    child: PwaDateTimePicker(
                        isTime: true,
                        inlDate: mTime,
                        timeSetter: (value) => _updateTime(value),
                        isError: isError(mTime))),
                SizedBox(width: 4),
                Expanded(
                    child: PwaDateTimePicker(
                  isTime: false,
                  inlDate: mDate,
                  timeSetter: (value) => _updateDate(value),
                )),
              ]),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PlatformText("Result : " +
                      (mTime == null || mDate == null
                          ? ""
                          : dateTimeToDateTimeString(DateTime(
                              mDate.year,
                              mDate.month,
                              mDate.day,
                              mTime.hour,
                              mTime.minute))))),
              PwaDateTimePicker(
                  inlDate: mDateTime,
                  timeSetter: (value) => _updateDateTime(value),
                  isError: isError(mDateTime)),
            ]))));
  }

  List<dynamic> isError(DateTime dt) {
    List<dynamic> res = new List();
    if (dt != null && dt.hour < 14) {
      res.add(true);
      res.add("Error");
    } else {
      res.add(false);
      res.add("Error");
    }
    return res;
  }

  List<dynamic> isError1() {
    List<dynamic> res = new List();
    res.add(false);
    res.add("test");
    return res;
  }

  List<dynamic> isError2() {
    List<dynamic> res = new List();
    res.add(false);
    res.add("test");
    return res;
  }

  List<dynamic> isError3() {
    List<dynamic> res = new List();
    res.add(false);
    res.add("test");
    return res;
  }
}
