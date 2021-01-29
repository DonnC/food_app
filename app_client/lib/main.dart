import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/screens/index.dart';
import 'package:restaurant_app/services/index.dart';
import 'package:restaurant_app/utils/index.dart';

// TODO: Contribute to scaled_animated_scaffold plugin, have PR
// TODO: Add shimmer package

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(momentum());
}

Momentum momentum() => Momentum(
      key: UniqueKey(),
      restartCallback: main,
      child: MyApp(),
      controllers: [
        LoginSignupForgotController(),
        HomePageController()
          ..config(
            enableLogging: true,
            lazy: true,
          ),
        StartPageController(),
        CartController(),
      ],
      services: [
        AuthService(),
        ProductService(),
        MomentumRouter(
          [
            LoginSignupForgot(),
            StartPage(),
            HomePage(),
            CartPage(),
          ],
        ),
      ],
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: colorTheme,
      home: MomentumRouter.getActivePage(context),
    );
  }
}
