import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosBottomPicker extends StatelessWidget {
  const IosBottomPicker({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        padding: const EdgeInsets.only(top: 6.0),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: DefaultTextStyle(
            style: TextStyle(
              color: CupertinoColors.label.resolveFrom(context),
              fontSize: 22.0,
            ),
            child: GestureDetector(
                // Blocks taps from propagating to the modal sheet and popping.
                onTap: () {},
                child: SafeArea(
                  top: false,
                  child: child,
                ))));
  }
}
