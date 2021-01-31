import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/widgets/index.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RouterPage(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double _w = constraints.maxWidth;
          final double _h = constraints.maxHeight;
          final double _chipRadius = 40;

          return MomentumBuilder(
            controllers: [
              CartController,
              UserProfileController,
            ],
            builder: (context, snapshot) {
              final _cartModel = snapshot<CartModel>();
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
                      padding: const EdgeInsets.all(15),
                      child: SingleChildScrollView(
                        child: _userModel.user.favorites.isEmpty
                            ? Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: _h * 0.3),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Icon(
                                        LineIcons.heart_o,
                                        color: Colors.grey,
                                        size: _w * 0.2,
                                      ),
                                      SizedBox(height: 30),
                                      Text(
                                        'Your favorites is empty',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : GridView.count(
                              // TODO: Use staggered grid view instead
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 30,
                                children: _userModel.user.favorites
                                    .map(
                                      (favProduct) => productContainer(
                                        context: context,
                                        product: favProduct,
                                        cartController: _cartModel.controller,
                                      ),
                                    )
                                    .toList(),
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
