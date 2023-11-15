// NOTE: Most of the credit for this code goes to 'funwithflutter' on GitHub
library popup_card;

import 'package:flutter/material.dart';
import 'package:popup_card/src/hero_route.dart';

// [PopupItemLauncher], when wrapped around a widget like an [Icon], launches the [PopUpItem] widget.
class PopupItemLauncher extends StatelessWidget {
  final Object? tag;
  final Widget? child;
  final Widget? popUp;
  const PopupItemLauncher({Key? key, this.tag, this.child, this.popUp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return popUp!;
        }));
      },
      child: Hero(
        tag: tag!,
        child: child!,
      ),
    );
  }
}

// This is the actual pop up card. You provide this to [PopUpItemLauncher].
class PopUpItem extends StatelessWidget {
  final Object tag;
  final Widget child;
  final Alignment alignment;
  final double reservedAppbarHeight;

  PopUpItem(
      {Key? key,
      required this.tag,
      required this.child,
      this.alignment = Alignment.center,
      this.reservedAppbarHeight = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Hero(
        tag: tag,
        child: Container(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(top: reservedAppbarHeight),
            child: SingleChildScrollView(child: child),
          ),
        ),
      ),
    );
  }
}
