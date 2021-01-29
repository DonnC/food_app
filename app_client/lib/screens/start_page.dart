import 'dart:math';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:momentum/momentum.dart';

import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/screens/index.dart';
import 'package:restaurant_app/utils/index.dart';
import 'package:restaurant_app/widgets/index.dart';

class StartPage extends StatelessWidget {
  final double _spacer = 20.0;

  static List<Widget> _appScreens = <Widget>[
    HomePage(),
    HomePage(),
    HomePage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return RouterPage(
      child: MomentumBuilder(
        controllers: [StartPageController],
        builder: (context, snapshot) {
          final _model = snapshot<StartPageModel>();

          return SafeArea(
            child: ScaledAnimatedScaffold(
              backgroundColor: loginBgColor,
              layerColor: Theme.of(context).primaryColor.withOpacity(0.7),
              appBar: ScaledAnimatedScaffoldAppBar(
                leadingIcon: Icon(
                  Icons.menu,
                  color: textColor,
                ),
                actions: [
                  Spacer(),
                  Center(
                    child: Text(
                      _model.appBarTitle,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(),
                ],
              ),
              menuConfiguration: ScaledAnimatedScaffoldMenuConfiguration(
                backgroundColor: loginUpperColor.withOpacity(0.8),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ScaledAnimatedScaffoldMenuButton(
                      icon: Icon(
                        LineIcons.heart_o,
                        color: textColor,
                      ),
                      label: Text(
                        'Favorites',
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(height: _spacer),
                    ScaledAnimatedScaffoldMenuButton(
                      icon: Icon(
                        LineIcons.credit_card,
                        color: textColor,
                      ),
                      label: Text(
                        'Payment Methods',
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(height: _spacer),
                    ScaledAnimatedScaffoldMenuButton(
                      icon: Icon(
                        LineIcons.opencart,
                        color: textColor,
                      ),
                      label: Text(
                        'My Order',
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(height: _spacer),
                    ScaledAnimatedScaffoldMenuButton(
                      icon: Icon(
                        LineIcons.history,
                        color: textColor,
                      ),
                      label: Text(
                        'History',
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(height: _spacer),
                    ScaledAnimatedScaffoldMenuButton(
                      icon: Icon(
                        LineIcons.commenting_o,
                        color: textColor,
                      ),
                      label: Text(
                        'Complaint',
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(height: _spacer),
                    ScaledAnimatedScaffoldMenuButton(
                      icon: Icon(
                        LineIcons.sticky_note,
                        color: textColor,
                      ),
                      label: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                footer: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ScaledAnimatedScaffoldMenuButton(
                    icon: Transform(
                      transform: Matrix4.rotationY(pi),
                      child: Icon(
                        Icons.logout,
                        color: textColor,
                      ),
                    ),
                    label: Text(
                      'Log out',
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              body: _appScreens[_model.selectedPageIndex],
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(25),
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => _model.update(
                          selectedPageIndex: 0,
                          appBarTitle: '',
                        ),
                        child: Icon(
                          LineIcons.home,
                          color: _model.selectedPageIndex == 0
                              ? buttonBgColor
                              : textColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _model.update(
                          selectedPageIndex: 1,
                          appBarTitle: 'My Favorites',
                        ),
                        child: Icon(
                          LineIcons.heart_o,
                          color: _model.selectedPageIndex == 1
                              ? buttonBgColor
                              : textColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _model.update(
                          selectedPageIndex: 2,
                          appBarTitle: 'Notifications',
                        ),
                        child: Icon(
                          LineIcons.bell,
                          color: _model.selectedPageIndex == 2
                              ? buttonBgColor
                              : textColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _model.update(
                          selectedPageIndex: 3,
                          appBarTitle: 'My Cart',
                        ),
                        child: Icon(
                          LineIcons.shopping_cart,
                          color: _model.selectedPageIndex == 3
                              ? buttonBgColor
                              : textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
