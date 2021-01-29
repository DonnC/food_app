import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/constants/index.dart';
import 'package:restaurant_app/models/index.dart';
import 'package:restaurant_app/utils/index.dart';

import 'index.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends MomentumState<HomePage> {
  HomePageController _homePageController;
  CartController _cartController;

  @override
  void initMomentumState() {
    _homePageController = Momentum.controller<HomePageController>(context);
    _cartController = Momentum.controller<CartController>(context);

    // listen for home-page events
    _homePageController.listen<HomePageEvent>(
        state: this,
        invoke: (event) {
          switch (event.action) {
            case HomePageEventAction.Error:
              // TODO: show error pop-up dialog
              break;
            default:
          }
        });
  }

  Widget _buildFoodCategoryField(int index) {
    return GestureDetector(
      onTap: () => _homePageController.model.update(selectedIndex: index),
      child: Container(
        height: 40.0,
        width: 90,
        child: Column(
          children: [
            Text(
              categories[index],
              style: TextStyle(
                fontSize: 17,
                color: _homePageController.model.selectedIndex == index
                    ? Colors.white
                    : textColor,
              ),
            ),
            SizedBox(height: 7),
            Container(
              decoration: BoxDecoration(
                color: _homePageController.model.selectedIndex == index
                    ? buttonBgColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 15,
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCarousel() {
    return Container(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildFoodCategoryField(index);
        },
      ),
    );
  }

  Widget _buildProductList(HomePageModel model) {
    final _size = MediaQuery.of(context).size;

    final List<Product> _products = model.products;
    var productsPerCategory = _products
        .where((product) => product.category == categories[model.selectedIndex])
        .toList();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final Product p = productsPerCategory[index];

            return InkWell(
              onTap: () => MomentumRouter.goto(
                context,
                ProductDetailsPage,
                params: ProductDetailsPageParam(
                  product: p,
                ),
              ),
              child: Container(
                width: _size.width * 0.5,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: loginBgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Center(
                        child: Image.asset(
                          p.imageUrl,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      p.name,
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      p.contents,
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '\$${(p.price).toStringAsFixed(2)}',
                          style: TextStyle(
                            color: homePriceColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () =>
                              _cartController.addToCart(Cart(product: p)),
                          child: CircleAvatar(
                            backgroundColor: buttonBgColor,
                            child: Center(
                              child: Icon(
                                LineIcons.shopping_cart,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (ctx, x) => SizedBox(width: 25),
          itemCount: productsPerCategory.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RouterPage(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double _w = constraints.maxWidth;
          final double _h = constraints.maxHeight;
          final double _chipRadius = 40;

          return ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(_chipRadius),
              bottomRight: Radius.circular(_chipRadius),
            ),
            child: MomentumBuilder(
              controllers: [HomePageController],
              builder: (context, snapshot) {
                final _model = snapshot<HomePageModel>();

                return Container(
                  color: Theme.of(context).primaryColor,
                  width: _w,
                  height: _h,
                  padding: const EdgeInsets.all(15),
                  child: _model.loading
                      ? Center(
                          // TODO: Use shimmer package
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fast and',
                              style: homeTitleStyle,
                            ),
                            Text(
                              'Delicious Food',
                              style: homeTitleStyle,
                            ),
                            SizedBox(height: 30),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: BoxDecoration(
                                    color: loginBgColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          LineIcons.search,
                                          color: textColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Search',
                                          style: TextStyle(
                                            color: textColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: buttonBgColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.tune,
                                      color: textColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            _buildCategoryCarousel(),
                            SizedBox(height: 25),
                            _buildProductList(_model),
                          ],
                        ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
