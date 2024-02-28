import 'package:flutter/material.dart';
import 'package:flutter_30days/Pages/cartPage.dart';
import 'package:flutter_30days/Pages/homeDetailPage.dart';
import 'package:flutter_30days/Pages/homePage.dart';
import 'package:flutter_30days/Pages/loginPage.dart';
import 'package:flutter_30days/utiles/myRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.cartPageRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartPageRoute: (context) => const CartPage(),
      },
    );
  }
}
