import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/constants/index.dart';
import 'package:restaurant_app/models/index.dart';
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
      opacity: 0.0,         // sigmaX & Y for blurring background widget
    );
  }

  Future<void> login(String email, String password) async {
    final _userController = dependOn<UserProfileController>();
    final _authService = getService<AuthService>();

    model.update(loading: true);

    AuthResponse _response = await _authService.login(email, password);

    switch (_response.action) {
      case AuthResponseAction.Success:
        // update user controller on successful login
        _userController.saveCurrentUser(_response.data);

        sendEvent(
          AuthEvent(
            action: AuthEventAction.Success,
            title: 'success',
            message: _response.message,
          ),
        );
        break;

      case AuthResponseAction.Fail:
        sendEvent(
          AuthEvent(
            action: AuthEventAction.Fail,
            message: _response.message,
          ),
        );
        break;
      default:
    }

    model.update(loading: false);
  }

  Future<void> signup(String username, String email, String password) async {
    final _userController = dependOn<UserProfileController>();

    final _authService = getService<AuthService>();

    model.update(loading: true);

    AuthResponse _response =
        await _authService.signup(username, email, password);

    switch (_response.action) {
      case AuthResponseAction.Success:
        // update user controller on successful signup
        _userController.saveCurrentUser(_response.data);

        sendEvent(
          AuthEvent(
            action: AuthEventAction.Success,
            message: _response.message,
          ),
        );
        break;

      case AuthResponseAction.Fail:
        sendEvent(
          AuthEvent(
            action: AuthEventAction.Fail,
            message: _response.message,
          ),
        );
        break;
      default:
    }

    model.update(loading: false);
  }

  Future<void> forgotPwd(String email) async {
    final _authService = getService<AuthService>();

    model.update(loading: true);

    AuthResponse _response = await _authService.forgotPassword(email);

    switch (_response.action) {
      case AuthResponseAction.Success:
        sendEvent(
          AuthEvent(
            action: AuthEventAction.SuccessEmailSend,
            message: _response.message,
          ),
        );
        break;

      case AuthResponseAction.Fail:
        sendEvent(
          AuthEvent(
            action: AuthEventAction.Fail,
            message: _response.message,
          ),
        );
        break;
      default:
    }

    model.update(loading: false);
  }

  Future<void> logout() async {
    // TODO: Implement logout
  }
}
