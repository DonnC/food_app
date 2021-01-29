import 'package:flutter/material.dart';

/// A custom button that aligns its content to the left, whereas
/// other buttons such as [FlatButton] centers its content
class ScaledAnimatedScaffoldMenuButton extends StatelessWidget {
  /// Creates a custom button that aligns its content to the left, whereas
  /// other buttons such as [FlatButton] centers its content
  const ScaledAnimatedScaffoldMenuButton({
    Key key,
    this.icon,
    @required this.label,
    @required this.onPressed,
  })  : assert(label != null),
        super(key: key);

  final Widget icon;
  final Widget label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(2),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (icon != null) ...[
                icon,
                SizedBox(
                  width: 8,
                )
              ],
              Flexible(
                child: label,
              ),
            ],
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
