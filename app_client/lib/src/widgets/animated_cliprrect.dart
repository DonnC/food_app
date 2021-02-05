import 'package:flutter/widgets.dart';

/// Custom ClipRRect that animates its border radius
class AnimatedClipRRect extends StatelessWidget {
  /// Creates a custom ClipRRect that animates its border radius
  const AnimatedClipRRect({
    @required this.duration,
    this.curve = Curves.linear,
    @required this.borderRadius,
    @required this.child,
  })  : assert(duration != null),
        assert(curve != null),
        assert(borderRadius != null),
        assert(child != null);

  final Duration duration;
  final Curve curve;
  final BorderRadius borderRadius;
  final Widget child;

  static Widget _builder(
      BuildContext context, BorderRadius radius, Widget child) {
    return ClipRRect(borderRadius: radius, child: child);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<BorderRadius>(
      duration: duration,
      curve: curve,
      tween: BorderRadiusTween(begin: BorderRadius.zero, end: borderRadius),
      builder: _builder,
      child: child,
    );
  }
}
