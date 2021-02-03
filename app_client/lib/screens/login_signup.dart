// login & sign up screen with popup forgot password screen
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/constants/index.dart';
import 'package:restaurant_app/screens/index.dart';
import 'package:restaurant_app/utils/index.dart';
import 'package:restaurant_app/widgets/index.dart';

class LoginSignupForgot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginSignupForgotState();
}

class _LoginSignupForgotState extends MomentumState<LoginSignupForgot> {
  // global keys
  final GlobalKey<FormState> _loginSignupFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _forgotpwdFormKey = GlobalKey<FormState>();

  // controllers
  TextEditingController _email;
  TextEditingController _password;
  TextEditingController _fullname;

  LoginSignupForgotController _loginSignupForgotController;

  @override
  void initMomentumState() {
    _loginSignupForgotController =
        Momentum.controller<LoginSignupForgotController>(context);

    // initiate controllers
    _email = TextEditingController();
    _password = TextEditingController();
    _fullname = TextEditingController();

    // listen for auth events
    _loginSignupForgotController.listen<AuthEvent>(
      state: this,
      invoke: (event) {
        switch (event.action) {
          case AuthEventAction.Success:
            _resetTextEditingControllers();
             MomentumRouter.clearHistoryWithContext(context);
            MomentumRouter.goto(context, StartPage);
            break;

          case AuthEventAction.SuccessEmailSend:
            // TODO: Implement dialog
            _resetTextEditingControllers();
            break;

          case AuthEventAction.ForgotPassword:
            _resetTextEditingControllers();
            _showForgotPasswordDialog();
            break;

          case AuthEventAction.Fail:
            // TODO: Show failed dialog
            _resetTextEditingControllers();
            break;

          case AuthEventAction.Error:
            // TODO: show error dialog
            _resetTextEditingControllers();
            break;

          default:
        }
      },
    );
  }

  void _resetTextEditingControllers() {
    _email.clear();
    _fullname.clear();
    _password.clear();
  }

  _showForgotPasswordDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        backgroundColor: loginBgColor,
        title: Row(
          children: [
            Text(
              'Forgot Password',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                _loginSignupForgotController.model.update(opacity: 0.0);
                _resetTextEditingControllers();
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: loginUpperColor,
                radius: 20,
                child: Center(
                  child: Icon(
                    Icons.close,
                    color: Colors.white60,
                  ),
                ),
              ),
            ),
          ],
        ),
        children: [
          Form(
            key: _forgotpwdFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Text(
                    'Email Address',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: customTextField(
                    controller: _email,
                    validateError: 'email address is required',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    minWidth: double.infinity,
                    height: 50,
                    color: buttonBgColor,
                    onPressed: () async {
                      if (_forgotpwdFormKey.currentState.validate()) {
                        // dismiss forgot pwd dialog first
                        _loginSignupForgotController.model.update(opacity: 0.0);

                        Navigator.pop(context);

                        await _loginSignupForgotController
                            .forgotPwd(_email.text.trim());
                      } else {
                        _resetTextEditingControllers();
                      }
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _fullname.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return RouterPage(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: loginBgColor,
          body: SingleChildScrollView(
            child: MomentumBuilder(
              controllers: [LoginSignupForgotController],
              builder: (context, snapshot) {
                final _loginModel = snapshot<LoginSignupForgotModel>();

                return _loginModel.loading
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: _size.height * 0.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LinearProgressIndicator(),
                          ),
                        ],
                      )
                    : Form(
                        key: _loginSignupFormKey,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: _loginModel.opacity,
                            sigmaY: _loginModel.opacity,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: _size.height * 0.4,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: loginUpperColor,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/fire.png'),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 50,
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _resetTextEditingControllers();
                                              _loginModel.update(
                                                  isLoginSelected: true);
                                            },
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Login',
                                                  style: TextStyle(
                                                    color: _loginModel
                                                            .isLoginSelected
                                                        ? Colors.white
                                                        : textColor,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: _loginModel
                                                            .isLoginSelected
                                                        ? buttonBgColor
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  width: 80,
                                                  height: 6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              _resetTextEditingControllers();
                                              _loginModel.update(
                                                  isLoginSelected: false);
                                            },
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Sign up',
                                                  style: TextStyle(
                                                    color: _loginModel
                                                            .isLoginSelected
                                                        ? textColor
                                                        : Colors.white,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: _loginModel
                                                            .isLoginSelected
                                                        ? Colors.transparent
                                                        : buttonBgColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  width: 80,
                                                  height: 6,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              _loginModel.isLoginSelected
                                  ? SizedBox()
                                  : SizedBox(height: 30),
                              _loginModel.isLoginSelected
                                  ? SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        'Full Name',
                                        style: TextStyle(
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                              _loginModel.isLoginSelected
                                  ? SizedBox()
                                  : customTextField(
                                      controller: _fullname,
                                      validateError: 'fullname is required',
                                    ),
                              SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  'Email Address',
                                  style: TextStyle(
                                    color: textColor,
                                  ),
                                ),
                              ),
                              customTextField(
                                controller: _email,
                                validateError: 'email address is required',
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                    color: textColor,
                                  ),
                                ),
                              ),
                              customTextField(
                                controller: _password,
                                validateError: 'password is required',
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                              ),
                              SizedBox(height: 10),
                              _loginModel.isLoginSelected
                                  ? Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          _loginModel.update(opacity: 1.2);

                                          _loginModel.controller.sendEvent(
                                            AuthEvent(
                                              action: AuthEventAction
                                                  .ForgotPassword,
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Forgot password?',
                                          style: TextStyle(
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                              SizedBox(height: 20),
                              _loginModel.isLoginSelected
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        minWidth: double.infinity,
                                        height: 50,
                                        color: buttonBgColor,
                                        onPressed: () async {
                                          if (_loginSignupFormKey.currentState
                                              .validate()) {
                                            await _loginModel.controller.login(
                                              _email.text.trim(),
                                              _password.text.trim(),
                                            );
                                          }
                                        },
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        minWidth: double.infinity,
                                        height: 50,
                                        color: buttonBgColor,
                                        onPressed: () async {
                                          if (_loginSignupFormKey.currentState
                                              .validate()) {
                                            await _loginModel.controller.signup(
                                              _fullname.text.trim(),
                                              _email.text.trim(),
                                              _password.text.trim(),
                                            );
                                          }
                                        },
                                        child: Text(
                                          'Sign up',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
