import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/constants/index.dart';
import 'package:restaurant_app/utils/index.dart';
import 'package:restaurant_app/widgets/index.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends MomentumState<ProfilePage> {
  UserProfileController _userProfileController;
  TextEditingController _textEditingController;

  final _space = SizedBox(height: 25);

  @override
  void initMomentumState() {
    _userProfileController =
        Momentum.controller<UserProfileController>(context);

    _textEditingController = TextEditingController();

    // TODO: listen to profile change event
    super.initMomentumState();
  }

  void _setTextControllerInitField(ProfileEditField field) {
    var value;

    switch (field) {
      case ProfileEditField.Contact:
        value = _userProfileController.model.user.contact;
        break;

      case ProfileEditField.Email:
        value = _userProfileController.model.user.email;
        break;

      case ProfileEditField.PaymentMethod:
        value = _userProfileController.model.user.paymentMethod;
        break;

      case ProfileEditField.Address:
        value = _userProfileController.model.user.address;
        break;
      default:
    }

    _textEditingController.text = value ?? '';
  }

  _showEditFieldDialog(ProfileEditField field, String title) {
    _setTextControllerInitField(field);

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
              'Edit $title',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                _textEditingController.clear();
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 10,
                ),
                child: Text(
                  '$title',
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8),
                child: customTextField(
                  controller: _textEditingController,
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
                  onPressed: () {
                    switch (field) {
                      case ProfileEditField.Contact:
                        _userProfileController.model.user.contact =
                            _textEditingController.text.trim();
                        break;

                      case ProfileEditField.Email:
                        _userProfileController.model.user.email =
                            _textEditingController.text.trim();
                        break;

                      case ProfileEditField.PaymentMethod:
                        _userProfileController.model.user.paymentMethod =
                            _textEditingController.text.trim();
                        break;

                      case ProfileEditField.Address:
                        _userProfileController.model.user.address =
                            _textEditingController.text.trim();
                        break;
                      default:
                    }

                    _textEditingController.clear();

                    // update model

                    _userProfileController.model.update();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RouterPage(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double _w = constraints.maxWidth;
            final double _h = constraints.maxHeight;
            final double _chipRadius = 40;

            return MomentumBuilder(
              controllers: [UserProfileController],
              builder: (context, snapshot) {
                final _model = snapshot<UserProfileModel>();
                final double _sigValue = 1.8;

                return SafeArea(
                  child: Stack(
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: _sigValue,
                          sigmaY: _sigValue,
                        ),
                        child: Container(
                          color: loginBgColor,
                          height: _h,
                          width: _w,
                          child: Image.asset(
                            'assets/images/fire.png',
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                'My Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () => MomentumRouter.pop(context),
                                child: Container(
                                  height: 40,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      LineIcons.close,
                                      size: 17,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: _h * 0.2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(_chipRadius),
                            topRight: Radius.circular(_chipRadius),
                          ),
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            width: _w,
                            height: _h * 0.8,
                            padding: const EdgeInsets.all(15),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: _h * 0.06,
                                      ),
                                      child: Text(
                                        _model.user.username,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  _space,
                                  profileRow(
                                    title: 'Phone Number',
                                    subtitle: _model.user.contact,
                                    icon: LineIcons.phone,
                                    onTapCallback: () => _showEditFieldDialog(
                                        ProfileEditField.Contact,
                                        'Phone Number'),
                                  ),
                                  _space,
                                  profileRow(
                                    title: 'Email',
                                    subtitle: _model.user.email,
                                    icon: Icons.email_outlined,
                                    onTapCallback: () => _showEditFieldDialog(
                                        ProfileEditField.Email,
                                        'Email Address'),
                                  ),
                                  _space,
                                  // TODO: Use drop down for payment methods
                                  profileRow(
                                    title: 'Payment Methods',
                                    subtitle: _model.user.paymentMethod,
                                    icon: LineIcons.credit_card,
                                    onTapCallback: () => _showEditFieldDialog(
                                        ProfileEditField.PaymentMethod,
                                        'Payment Method'),
                                  ),
                                  _space,
                                  profileRow(
                                    title: 'Address',
                                    subtitle: _model.user.address,
                                    icon: LineIcons.truck,
                                    onTapCallback: () => _showEditFieldDialog(
                                        ProfileEditField.Address, 'Address'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: _h * 0.1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: _w * 0.35),
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: textColor,
                              child: Center(
                                child: Image.asset(
                                  'assets/images/fire.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: _h * 0.21,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: _w * 0.55),
                          child: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 8,
                            bottom: 20,
                          ),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            minWidth: _w * 0.9,
                            height: 50,
                            color: buttonBgColor,
                            onPressed: () async {
                              // save current user changes
                              await _model.controller.saveUserProfileChanges();
                            },
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
