import 'package:flutter/material.dart';

///This router will be show blurred transations
///this will provide fade transiton also.
///this is also being use to show background blur dialoge boxes
class TransparantRoute extends PageRoute<void> {
  TransparantRoute({
    required this.builder,
    this.barrierDismiss,
    super.settings,
    this.sigmaX,
    this.sigmaY,
  }) : super(fullscreenDialog: false);
  final double? sigmaX;
  final double? sigmaY;
  final bool? barrierDismiss;

  final WidgetBuilder builder;

  @override
  bool get opaque => false;
  @override
  Color get barrierColor => Colors.transparent;
  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => 'blurred';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 350);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final result = builder(context);

    return result;
  }
}
