import 'package:momentum/momentum.dart';

import 'index.dart';

class LoginSignupForgotModel
    extends MomentumModel<LoginSignupForgotController> {
  LoginSignupForgotModel(
    LoginSignupForgotController controller, {
    this.loading,
    this.isLoginSelected,
    this.opacity,
  }) : super(controller);

  final bool loading;
  final bool isLoginSelected; // switch between login & signup screens
  final double opacity;

  @override
  void update({
    bool loading,
    double opacity,
    bool isLoginSelected,
  }) {
    LoginSignupForgotModel(
      controller,
      loading: loading ?? this.loading,
      isLoginSelected: isLoginSelected ?? this.isLoginSelected,
      opacity: opacity ?? this.opacity,
    ).updateMomentum();
  }
}
