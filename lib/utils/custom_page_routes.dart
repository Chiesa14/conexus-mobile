import 'package:flutter/material.dart';

enum SlideDirection {
  rightToLeft,
  leftToRight,
  topToBottom,
  bottomToTop,
}

class SlidePageRoute extends PageRouteBuilder {
  final Widget widget;
  final SlideDirection direction;
  final Curve curve;
  final Duration duration;

  SlidePageRoute({
    required this.widget,
    this.direction = SlideDirection.rightToLeft,
    this.curve = Curves.easeInOut,
    this.duration = const Duration(milliseconds: 1000),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            Offset getBeginOffset() {
              switch (direction) {
                case SlideDirection.rightToLeft:
                  return const Offset(1.0, 0.0);
                case SlideDirection.leftToRight:
                  return const Offset(-1.0, 0.0);
                case SlideDirection.topToBottom:
                  return const Offset(0.0, -1.0);
                case SlideDirection.bottomToTop:
                  return const Offset(0.0, 1.0);
              }
            }

            final tween = Tween<Offset>(
              begin: getBeginOffset(),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: duration,
        );
}

class FadePageRoute extends PageRouteBuilder {
  final Widget widget;
  final Duration duration;

  FadePageRoute({
    required this.widget,
    this.duration = const Duration(milliseconds: 1000),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: duration,
        );
}

class ScalePageRoute extends PageRouteBuilder {
  final Widget widget;
  final Duration duration;
  final Curve curve;

  ScalePageRoute({
    required this.widget,
    this.duration = const Duration(milliseconds: 1000),
    this.curve = Curves.easeInOut,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation.drive(
                CurveTween(curve: curve).chain(
                  Tween<double>(begin: 0.0, end: 1.0),
                ),
              ),
              child: child,
            );
          },
          transitionDuration: duration,
        );
}

class RotationPageRoute extends PageRouteBuilder {
  final Widget widget;
  final Duration duration;
  final double turns;

  RotationPageRoute({
    required this.widget,
    this.duration = const Duration(milliseconds: 1000),
    this.turns = 1.0,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return RotationTransition(
              turns: Tween<double>(begin: turns, end: 0).animate(animation),
              child: child,
            );
          },
          transitionDuration: duration,
        );
}

class FlipPageRoute extends PageRouteBuilder {
  final Widget widget;
  final Duration duration;

  FlipPageRoute({
    required this.widget,
    this.duration = const Duration(milliseconds: 1000),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Rotation3DTransition(
              animation: animation,
              child: child,
            );
          },
          transitionDuration: duration,
        );
}

class Rotation3DTransition extends AnimatedWidget {
  const Rotation3DTransition({
    super.key,
    required this.animation,
    required this.child,
  }) : super(listenable: animation);

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(animation.value),
      alignment: Alignment.center,
      child: child,
    );
  }
}

class ZoomFadeRoute extends PageRouteBuilder {
  final Widget widget;
  final Duration duration;

  ZoomFadeRoute({
    required this.widget,
    this.duration = const Duration(milliseconds: 1000),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation.drive(
                  Tween<double>(begin: 0.95, end: 1.0)
                      .chain(CurveTween(curve: Curves.easeOut)),
                ),
                child: child,
              ),
            );
          },
          transitionDuration: duration,
        );
}
