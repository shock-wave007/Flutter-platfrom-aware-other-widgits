import 'package:all_ios_widgits/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool pSwitch = true;
  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
        initialPlatform: TargetPlatform.iOS,
        builder: (BuildContext context) {
          return PlatformApp(
            debugShowCheckedModeBanner: false,
            title: "All Ios Widget",
            home: Home(),
          );
        });
  }
}
