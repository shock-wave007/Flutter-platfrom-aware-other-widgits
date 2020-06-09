import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PwaRadioGrpSegment extends StatelessWidget {
  final List<String> strList;
  final Function fn;
  final dynamic cVal;
  const PwaRadioGrpSegment({Key key, this.strList, this.fn, this.cVal})
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
                material: (_, __) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(flex: 1, child: PlatformText(element)),
                      Expanded(
                        flex: 0,
                        child: Radio(
                            value: element,
                            groupValue: cVal,
                            onChanged: (a) => fn(a)),
                      )
                    ]),
              ));
    });
    return res;
  }

  @override
  Widget build(BuildContext context) {
    Map<dynamic, Widget> temp = strListToDyWdMap(strList);
    List<Widget> _list = temp.values.toList();
    return PlatformWidget(
        cupertino: (_, __) => CupertinoSegmentedControl(
            groupValue: cVal, children: temp, onValueChanged: (a) => fn(a)),
        material: (_, __) => GridView.builder(
            itemCount: temp.length,
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return _list[index];
            })
        /*Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            temp.entries.map((e) => e.value).toList(),
      ),*/
        );
  }
}
