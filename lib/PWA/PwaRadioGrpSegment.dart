import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PwaRadioGrpSegment extends StatelessWidget {
  final List<String> strList;
  final Function fn;
  final dynamic cVal;
  final bool isIosSliding;
  const PwaRadioGrpSegment(
      {Key key, this.strList, this.fn, this.cVal, this.isIosSliding = true})
      : super(key: key);

  Map<dynamic, Widget> strListToDyWdMap(List<String> mMap) {
    Map<dynamic, Widget> res = new Map();
    mMap.forEach((element) {
      res.putIfAbsent(
          element,
          () => PlatformWidget(
              cupertino: (_, __) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PlatformText(element),
                  ),
              material: (_, __) => Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                        Flexible(child: PlatformText(element)),
                        Radio(
                            value: element,
                            groupValue: cVal,
                            onChanged: (a) => fn(a))
                      ]))));
    });
    return res;
  }

  @override
  Widget build(BuildContext context) {
    Map<dynamic, Widget> temp = strListToDyWdMap(strList);
    List<Widget> _list = temp.values.toList();
    return PlatformWidget(
        cupertino: (_, __) => isIosSliding
            ? CupertinoSlidingSegmentedControl(
                groupValue: cVal, children: temp, onValueChanged: (a) => fn(a))
            : CupertinoSegmentedControl(
                groupValue: cVal, children: temp, onValueChanged: (a) => fn(a)),
        material: (_, __) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _list
                .map((e) => e)
                .toList() // temp.entries.map((e) => e.value).toList(),
            ));
  }
}
