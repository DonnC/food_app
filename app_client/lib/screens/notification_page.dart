import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:momentum/momentum.dart';

import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/widgets/index.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RouterPage(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double _w = constraints.maxWidth;
          final double _h = constraints.maxHeight;
          final double _chipRadius = 40;

          return MomentumBuilder(
            controllers: [UserProfileController],
            builder: (context, snapshot) {
              final _userModel = snapshot<UserProfileModel>();

              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(_chipRadius),
                      bottomRight: Radius.circular(_chipRadius),
                    ),
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      width: _w,
                      height: _h,
                      //padding: const EdgeInsets.all(15),
                      child: SingleChildScrollView(
                        child: _userModel.user.notifications.isEmpty
                            ? emptyWidget(
                                height: _h,
                                width: _w,
                                message: 'You have no any new notifications!',
                                icon: LineIcons.bell_slash_o,
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _userModel.user.notifications.length,
                                itemBuilder: (_, int index) {
                                  final _notify =
                                      _userModel.user.notifications[index];

                                  // to change notifications colors
                                  bool _isEven = index % 2 == 0 ? true : false;

                                  final int points = _notify.points;
                                  final int daysAgo = DateTime.now()
                                      .difference(_notify.notifiedOn)
                                      .inDays;

                                  return notificationTile(
                                    points: points,
                                    daysAgo: daysAgo,
                                    isEven: _isEven,
                                    oddColor: Theme.of(context).primaryColor,
                                    w: _w,
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
