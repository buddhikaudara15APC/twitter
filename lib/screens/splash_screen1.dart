import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'splash_screen2.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});


  @override
  Widget build(BuildContext context) {

  final timer = Timer(
  const Duration(seconds: 3),
  () {
    Navigator.of(context).pushNamed(SplashScreen2.routeName);
     },
   );

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  statusBarColor: Color(0xff1DA1F2), 
));
    return Scaffold(
      backgroundColor: Color(0xff1DA1F2),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: Image.asset('assets/images/t0.png',fit: BoxFit.cover,),
        ),
      ),
    );
  }
}