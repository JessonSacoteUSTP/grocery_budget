// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'app_state/cart_data.dart';
import 'app_state/history_data.dart';
import 'screens/cart_screen/cart_screen.dart';
import 'screens/history_screen/history_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/my_list_screen/my_list_screen.dart';
import 'screens/my_list_screen/my_list_screen_TRIAL.dart';
import 'screens/shopping_screen/start_shopping.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return ChangeNotifierProvider(
        create: (context) => CartData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Grocery Budget',
          initialRoute: '/homescreen',
          routes: {
            '/homescreen': (context) => HomeScreen(),
            '/myList': (context) => MyListScreen(),
            '/historyscreen': (context) => HistoryScreen(),
            '/startShopping': (context) => StartShopping(),
            '/cart': (context) => MyCart(),
            '/try': (context) => MyListFormxx(),
          },
        ),
      );
    });
  }
}
