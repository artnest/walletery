import 'dart:io';

import 'package:flutter/material.dart';

import '../util/routes.dart';

class Sheets {
  static Future<T> showSheet<T>({
    @required BuildContext context,
    @required WidgetBuilder builder,
    Color color,
    double radius = 30.0,
    Color bgColor,
    int animationDurationMs = 250,
    bool removeUntilHome = false,
    bool closeOnTap = false,
    Function onDisposed,
  }) {
    assert(context != null);
    assert(builder != null);
    assert(radius != null && radius > 0.0);
    if (color == null) {
      color = Theme.of(context).dialogTheme.backgroundColor;
    }
    if (bgColor == null) {
      bgColor = Colors.black54;
    }
    final route = _ModalRoute<T>(
      builder: builder,
      color: color,
      radius: radius,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      bgColor: bgColor,
      animationDurationMs: animationDurationMs,
      closeOnTap: closeOnTap,
      onDisposed: onDisposed,
    );
    if (removeUntilHome) {
      return Navigator.pushAndRemoveUntil<T>(
        context,
        route,
        RouteUtils.withNameLike('/home'),
      );
    }
    return Navigator.push<T>(context, route);
  }
}

class _ModalRoute<T> extends PopupRoute<T> {
  _ModalRoute(
      {this.builder,
      this.barrierLabel,
      this.color,
      this.radius,
      RouteSettings settings,
      this.bgColor,
      this.animationDurationMs,
      this.closeOnTap,
      this.onDisposed})
      : super(settings: settings);

  final WidgetBuilder builder;
  final double radius;
  final Color color;
  final Color bgColor;
  final int animationDurationMs;
  final bool closeOnTap;
  final Function onDisposed;

  @override
  Color get barrierColor => bgColor;

  @override
  bool get barrierDismissible => true;

  @override
  String barrierLabel;

  @override
  void didComplete(T result) {
    if (onDisposed != null) {
      onDisposed();
    }
    super.didComplete(result);
  }

  AnimationController _animationController;
  CurvedAnimation sheetAnimation;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController =
        BottomSheet.createAnimationController(navigator.overlay);
    _animationController.duration = Duration(milliseconds: animationDurationMs);
    sheetAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.linear)
      ..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {
          sheetAnimation.curve = Curves.linear;
        }
      });
    return _animationController;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GestureDetector(
        onTap: () {
          if (closeOnTap) {
            // Close when tapped anywhere
            Navigator.of(context).pop();
          }
        },
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: AnimatedBuilder(
            animation: sheetAnimation,
            builder: (context, child) {
              return CustomSingleChildLayout(
                delegate: _SheetLayout(sheetAnimation.value),
                child: BottomSheet(
                  animationController: _animationController,
                  onClosing: () => Navigator.pop(context),
                  builder: (context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: this.color,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(this.radius),
                          topRight: Radius.circular(this.radius),
                        ),
                      ),
                      child: Builder(builder: this.builder),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get maintainState => false;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration =>
      Duration(milliseconds: animationDurationMs);
}

class _SheetLayout extends SingleChildLayoutDelegate {
  _SheetLayout(this.progress);

  final double progress;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    if (constraints.maxHeight < 667)
      return BoxConstraints(
          minWidth: constraints.maxWidth,
          maxWidth: constraints.maxWidth,
          minHeight: 0.0,
          maxHeight: constraints.maxHeight * 0.95);
    if ((constraints.maxHeight / constraints.maxWidth > 2.1 &&
            Platform.isAndroid) ||
        constraints.maxHeight > 812) {
      return BoxConstraints(
          minWidth: constraints.maxWidth,
          maxWidth: constraints.maxWidth,
          minHeight: 0.0,
          maxHeight: constraints.maxHeight * 0.8);
    } else {
      return BoxConstraints(
          minWidth: constraints.maxWidth,
          maxWidth: constraints.maxWidth,
          minHeight: 0.0,
          maxHeight: constraints.maxHeight * 0.9);
    }
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height * progress);
  }

  @override
  bool shouldRelayout(_SheetLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
