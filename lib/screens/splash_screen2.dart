import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'intro_page.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});
static const routeName = 'Splash';
  @override
  Widget build(BuildContext context) {

    final timer = Timer(
  const Duration(seconds: 3),
  () {
    Navigator.of(context).pushNamed(IntroPage.routeName);
     },
   );

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  statusBarColor: Colors.white,
));
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        const SizedBox(
                          height: 80,
                          width: 80,
                          child:  CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xff1DA1F2)),
                                          strokeWidth: 0.7,      
                                  ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.all(18),
                          child: Image.asset('assets/images/t4.png'),
                        ),
                        
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Text('Loading...',style: TextStyle(color:Color(0xff171412)),),
                  ],
                ),
              ),
              
              
           
      
    );
  }
}