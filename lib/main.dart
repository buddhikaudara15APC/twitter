import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:twitter_app/providers/auth.dart';
import 'package:twitter_app/screens/auth.dart';
import 'package:twitter_app/screens/home_page.dart';
import './screens/register_page.dart';
import './screens/login_page.dart';
import 'screens/splash_screen2.dart';
import 'screens/intro_page.dart';
import 'screens/splash_screen1.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen1(),
        // home: AuthScreen(),
        routes: {
        SplashScreen2.routeName:(c)=>const SplashScreen2(),
        IntroPage.routeName:(c)=>const IntroPage(),
        LoginPage.routeName:(c)=>const LoginPage(),
        RegisterPage.routeName:(c)=>const RegisterPage(),
        // HomePage.routeName:(c)=> HomePage(),
        },
    );
    
  }
}

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// import 'screens/login_screen.dart';

// void main() async{
// WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
// runApp(const MyApp());
// }
 

// class MyApp extends StatelessWidget {
// const MyApp({Key? key}) : super(key: key);

// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     title: 'SJI Info',
//     debugShowCheckedModeBanner: false,
//     theme: ThemeData(
//       brightness: Brightness.light,
//       primarySwatch: Colors.blue,
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           textStyle: const TextStyle(
//             fontSize: 24.0,
//           ),
//           padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
//         ),
//       ),
//       textTheme: TextTheme(
//         headline1: TextStyle(
//           fontSize: 46.0,
//           color: Colors.blue.shade700,
//           fontWeight: FontWeight.w500,
//         ),
//         bodyText1: const TextStyle(fontSize: 18.0),
//       ),
//     ),
//     home: LoginScreen(),
//   );
// }
// }