import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:restaurant_app/components/index.dart';
import 'package:restaurant_app/screens/index.dart';
import 'package:restaurant_app/services/index.dart';
import 'package:restaurant_app/utils/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(momentum());
}

Momentum momentum() => Momentum(
      key: UniqueKey(),
      restartCallback: main,
      child: MyApp(),
      //appLoader: customLoader(loaderText: 'Initializing...', isInitLoader: true),
      persistSave: (context, key, value) async {
        final sharedPref = await SharedPreferences.getInstance();
        var result = await sharedPref.setString(key, value);
        return result;
      },
      persistGet: (context, key) async {
        final sharedPref = await SharedPreferences.getInstance();
        var result = sharedPref.getString(key);
        return result;
      },
      controllers: [
        LoginSignupForgotController(),
        ProfilePageController(),
        StartPageController(),
        OrderPageController(),
        CartController()..config(maxTimeTravelSteps: 200),
        UserProfileController()..config(lazy: true),
        HomePageController()..config(lazy: true),
        ProductDetailsController()..config(lazy: true),
      ],
      services: [
        AuthService(),
        UserService(),
        ProductService(),
        MomentumRouter(
          [
            LoginSignupForgot(),
            StartPage(),
            HomePage(),
            CartPage(),
            FavoritesPage(),
            ProductDetailsPage(),
            NotificationPage(),
            ProfilePage(),
            OrderPaymentPage(),
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


