import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

Widget inkWellGesture(Function fun, {Widget child}) {
  return PlatformWidget(
      android: (_) => InkWell(onTap: fun, child: AbsorbPointer(child: child)),
      ios: (_) =>
          GestureDetector(onTap: fun, child: AbsorbPointer(child: child)));
}
