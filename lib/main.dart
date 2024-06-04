import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/auth/login_or_register.dart';
import 'package:flutter_food_delivery/models/restaurant.dart';
import 'package:flutter_food_delivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      //Theme provider
      ChangeNotifierProvider(create: (context) => ThemeProvider(),),

      //restaurant provider
       ChangeNotifierProvider(create: (context) => Restaurant(),),
     ],
     child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    ); //MaterialApp
  }
}