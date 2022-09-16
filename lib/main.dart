import 'package:ecommerce/api_services/api_service.dart';
import 'package:ecommerce/provider/cat_provider.dart';
import 'package:ecommerce/provider/order_provider.dart';
import 'package:ecommerce/provider/profile_provider.dart';
import 'package:ecommerce/screens/login_page.dart';
import 'package:ecommerce/screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => OrderProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CatProvider(),
          ),
          // ChangeNotifierProvider(
          //   create: (context) => ProfileProvider(),
          // ),
        ],
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()));
  }
}
