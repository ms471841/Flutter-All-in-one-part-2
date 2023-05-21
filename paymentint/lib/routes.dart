import 'package:flutter/material.dart';
import 'package:paymentint/screens/home.dart';
import 'package:paymentint/screens/payment.dart';
import 'package:paymentint/screens/profile.dart';
import 'package:paymentint/screens/signup.dart';
import 'package:paymentint/screens/splash.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => Splash(),
  '/signup': (context) => Signup(),
  '/home': (context) => HomeScreen(),
  '/payment': (context) => PaymentScreen(),
 '/profile': (context) => ProfileUI(),

  
  

};
