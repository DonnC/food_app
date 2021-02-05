import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/constants/index.dart';
import 'package:restaurant_app/models/index.dart';
import 'package:restaurant_app/utils/index.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends MomentumState<ProductDetailsPage> {
  ProductDetailsController _productDetailsController;
  Product _product;

  @override
  void initMomentumState() {
    _productDetailsController =
        Momentum.controller<ProductDetailsController>(context);

    _productDetailsController.checkFav();

    _product =
        MomentumRouter.getParam<ProductDetailsPageParam>(context).product;

    _productDetailsController.listen<ProductDetailsEvent>(
      state: this,
      invoke: (event) {
        switch (event.action) {
          case ProductDetailsEventAction.Success:
            print('event fired, message: ${event.message}');
            // TODO: show toast / dialog
            break;
          default:
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RouterPage(
      child: Scaffold(
        backgroundColor: loginBgColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double _w = constraints.maxWidth;
            final double _h = constraints.maxHeight;
            final double _chipRadius = 40;

            return MomentumBuilder(
                controllers: [ProductDetailsController],
                builder: (context, snapshot) {
                  final _model = snapshot<ProductDetailsModel>();

                  return SafeArea(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(_chipRadius),
                            bottomRight: Radius.circular(_chipRadius),
                          ),
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            width: _w,
                            height: _h * 0.8,
                            child: SingleChildScrollView(
                              child: _product == null
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: _h * 0.3),
                                      child: Column(
                                        children: [
                                          Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: _w,
                                          height: _h * 0.43,
                                          color: Colors.transparent,
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: _w,
                                                height: _h * 0.4,
                                                decoration: BoxDecoration(
                                                  color: loginBgColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                        _chipRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            _chipRadius),
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 15,
                                                        right: 15,
                                                        top: 10,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () =>
                                                                MomentumRouter
                                                                    .pop(
                                                                        context),
                                                            child: Container(
                                                              height: 40,
                                                              width: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                              child: Center(
                                                                child: Icon(
                                                                  Icons
                                                                      .chevron_left,
                                                                  color:
                                                                      textColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          GestureDetector(
                                                            onTap: () => _model
                                                                .controller
                                                                .toggleFavorite(),
                                                            child: Container(
                                                              height: 40,
                                                              width: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                              child: Center(
                                                                child: Icon(
                                                                  _model.isFavorite
                                                                      ? LineIcons
                                                                          .heart
                                                                      : LineIcons
                                                                          .heart_o,
                                                                  color: _model
                                                                          .isFavorite
                                                                      ? buttonBgColor
                                                                      : textColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 40,
                                                        ),
                                                        child: Text(
                                                          _product.name,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 27,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 35,
                                                        ),
                                                        child: Container(
                                                          width: _w * 0.6,
                                                          height:
                                                              _h * 0.4 * 0.6,
                                                          child: Image.asset(
                                                            // FIXME: use network image
                                                            _product.imageUrl,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 80),
                                                  child: Container(
                                                    height: 30,
                                                    width: 110,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 1),
                                                    decoration: BoxDecoration(
                                                      color: loginBgColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(23),
                                                        bottomRight:
                                                            Radius.circular(23),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () => _model
                                                              .controller
                                                              .decrProductCounter(),
                                                          child: CircleAvatar(
                                                            radius: 17,
                                                            backgroundColor:
                                                                Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                            child: Center(
                                                              child: Icon(
                                                                LineIcons.minus,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          '${_model.cartProductCounter}',
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                            color: textColor,
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        GestureDetector(
                                                          onTap: () => _model
                                                              .controller
                                                              .incrProductCounter(),
                                                          child: CircleAvatar(
                                                            radius: 17,
                                                            backgroundColor:
                                                                Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                            child: Center(
                                                              child: Icon(
                                                                LineIcons.plus,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Image.asset(
                                                  'assets/images/fire.png',
                                                  width: 24,
                                                  height: 24,
                                                ),
                                                SizedBox(height: 6),
                                                Text(
                                                  '${(_product.calories).toStringAsFixed(2)} cal',
                                                  style: TextStyle(
                                                    color: textColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Image.asset(
                                                  'assets/images/alarm-clock.png',
                                                  width: 24,
                                                  height: 24,
                                                ),
                                                SizedBox(height: 6),
                                                Text(
                                                  '${_product.minTime} - ${_product.maxTime} min',
                                                  style: TextStyle(
                                                    color: textColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Image.asset(
                                                  'assets/images/famous.png',
                                                  width: 24,
                                                  height: 24,
                                                ),
                                                SizedBox(height: 6),
                                                Text(
                                                  '${(_product.votes).toStringAsFixed(1)} vote',
                                                  style: TextStyle(
                                                    color: textColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Image.asset(
                                                  'assets/images/weighing-machine.png',
                                                  width: 24,
                                                  height: 24,
                                                ),
                                                SizedBox(height: 6),
                                                Text(
                                                  '${(_product.mass).toStringAsFixed(1)} g',
                                                  style: TextStyle(
                                                    color: textColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 25,
                                            bottom: 15,
                                          ),
                                          child: Text(
                                            'Description',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 21,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 25,
                                            right: 25,
                                            bottom: 8,
                                          ),
                                          child: Text(
                                            _product.description,
                                            softWrap: true,
                                            //overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: textColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            bottom: 30,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '\$${(_product.price).toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                minWidth: _w * 0.5,
                                height: 50,
                                color: buttonBgColor,
                                onPressed: () => _model.controller.addToCart(),
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
