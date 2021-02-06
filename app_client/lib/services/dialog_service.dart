import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';

class DialogService extends MomentumService {
  // TODO: Add more dialog callbacks
  void showFloatingFlushbar({
    BuildContext context,
    String title,
    String message,
    String position: 'top',
  }) {
    Flushbar(
      flushbarPosition:
          position == 'top' ? FlushbarPosition.TOP : FlushbarPosition.BOTTOM,
      duration: Duration(milliseconds: 1500),
      padding: EdgeInsets.all(10),
      borderRadius: 8,
      backgroundGradient: LinearGradient(
        colors: [Colors.green.shade800, Colors.greenAccent.shade700],
        stops: [0.6, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: title,
      message: message,
    )..show(context);
  }
}
