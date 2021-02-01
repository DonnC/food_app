import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends MomentumState<ProfilePage> {
  ProfilePageController _profilePageController;
  TextEditingController _textEditingController;

  @override
  void initMomentumState() {
    _profilePageController =
        Momentum.controller<ProfilePageController>(context);

    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
