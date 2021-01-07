import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/events/index.dart';
import 'package:restaurant_app/constants/index.dart';
import 'package:restaurant_app/services/index.dart';

import 'index.dart';

class LoginSignupForgotController
    extends MomentumController<LoginSignupForgotModel> {
  @override
  LoginSignupForgotModel init() {
    return LoginSignupForgotModel(
      this,
      email: '',
      password: '',
      username: '',
      loading: false,
    );
  }

  Future<void> login() async {
    final _authService = getService<AuthService>(alias: appAlias);
    var _result = _authService.login(model.email, model.password);

    if (_result == true) {
      sendEvent(
        AuthEvent(
          action: AuthEventAction.Success,
          title: 'success',
          message: 'login successful',
        ),
      );
    } else {
      sendEvent(
        AuthEvent(
          action: AuthEventAction.Fail,
          title: 'failed',
          message: 'Failed to login. Please try again later',
        ),
      );
    }
  }

  Future<void> signup() async {
    final _authService = getService<AuthService>(alias: appAlias);
    var _result = _authService.signup(model.username, model.email, model.password);

    if (_result == true) {
      sendEvent(
        AuthEvent(
          action: AuthEventAction.Success,
          title: 'success',
          message: 'signup successful',
        ),
      );
    } else {
      sendEvent(
        AuthEvent(
          action: AuthEventAction.Fail,
          title: 'failed',
          message: 'Failed to create account. Please try again later',
        ),
      );
    }
  }

  Future<void> forgotPwd() async {
    final _authService = getService<AuthService>(alias: appAlias);
    var _result = _authService.forgotPassword(model.email);

    if (_result == true) {
      sendEvent(
        AuthEvent(
          action: AuthEventAction.Success,
          title: 'success',
          message: 'Password reset instructions sent successfully. Please check your email',
        ),
      );
    } else {
      sendEvent(
        AuthEvent(
          action: AuthEventAction.Fail,
          title: 'failed',
          message: 'Failed to sent reset-password instructions to email. Please try again later',
        ),
      );
    }
  }

}
