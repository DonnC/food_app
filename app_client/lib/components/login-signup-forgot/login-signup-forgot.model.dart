import 'package:momentum/momentum.dart';

import 'index.dart';

class LoginSignupForgotModel
    extends MomentumModel<LoginSignupForgotController> {
  LoginSignupForgotModel(
    LoginSignupForgotController controller, {
    this.email,
    this.password,
    this.username,
    this.loading,
  }) : super(controller);

  final String email;
  final String password;
  final String username;
  final bool loading;

  @override
  void update({
    String email,
    String password,
    String username,
    bool loading,
  }) {
    LoginSignupForgotModel(
      controller,
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      loading: loading ?? this.loading,
    ).updateMomentum();
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'username': username,
      'loading': loading,
    };
  }

  LoginSignupForgotModel fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return LoginSignupForgotModel(
      controller,
      email: map['email'],
      password: map['password'],
      username: map['username'],
      loading: map['loading'],
    );
  }
}
