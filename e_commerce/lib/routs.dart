import 'package:e_commerce/screens/Home/HomePage.dart';
import 'package:e_commerce/screens/Sign_in/sign_in-screen.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  HomePage.routeName: (context) => HomePage(),
};
