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
      loading: false,
      isLoginSelected: true,
      opacity: 1.0,
    );
  }

  Future<void> login(String email, String password) async {
    final _authService = getService<AuthService>();

    model.update(loading: true);

    var _result = await _authService.login(email, password);

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

    model.update(loading: false);
  }

  Future<void> signup(String username, String email, String password) async {
    final _authService = getService<AuthService>();

    model.update(loading: true);

    // FIXME: Use the [User] class model

    var _result = await _authService.signup(username, email, password);

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

    model.update(loading: false);
  }

  Future<void> forgotPwd(String email) async {
    final _authService = getService<AuthService>();

    model.update(loading: true);

    var _result = await _authService.forgotPassword(email);

    if (_result == true) {
      sendEvent(
        AuthEvent(
          action: AuthEventAction.SuccessEmailSend,
          title: 'success',
          message:
              'Password reset instructions sent successfully. Please check your email',
        ),
      );
    } else {
      sendEvent(
        AuthEvent(
          action: AuthEventAction.Fail,
          title: 'failed',
          message:
              'Failed to sent reset-password instructions to email. Please try again later',
        ),
      );
    }

    model.update(loading: false);
  }

  Future<void> logout() async {
    // TODO: Implement logout
  }
}
