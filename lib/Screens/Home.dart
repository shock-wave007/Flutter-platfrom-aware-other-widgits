import 'package:all_ios_widgits/PWA/PwaRadioGrpSegment.dart';
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
              
              PwaRadioGrpSegment(
                strList: ["SunLight", "MoonLight", "NoLight"],
                fn: (a) => _updatePwaRadioGrpSEG(a),
                cVal: mREs,
              )
            ]))));
  }
}
