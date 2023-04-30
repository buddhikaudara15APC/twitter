import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/register_page.dart';

import 'login_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
static const routeName = 'Intro';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  statusBarColor: Colors.white,
));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(50),
              padding: EdgeInsets.all(10),
              height: 60,
              width: 60,
              child: Image.asset('assets/images/t4.png',fit: BoxFit.cover,)
              ),
          ),
          const SizedBox(height: 10,),
          const Text("see what's\nhappening in\nthe world right\nnow.",
          style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 20,),
          Container(
            height: MediaQuery.of(context).size.height*0.07,
            width: MediaQuery.of(context).size.width*0.68,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 1,color: Colors.grey)
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset('assets/images/g1.png',fit: BoxFit.cover,)
                  ),
                const SizedBox(width: 10,),
                const Text('Continue with Google',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          const Text('---------------------or---------------------',
          style: TextStyle(fontSize: 20,color: Colors.grey),
          ),
          const SizedBox(height: 10,),
          Container(
            height: MediaQuery.of(context).size.height*0.07,
            width: MediaQuery.of(context).size.width*0.68,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xff171412)
            ),
            child: Center(
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(RegisterPage.routeName);
                }, 
                child:Text('Create account',
              style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900),
              ),
                ),
            ),
          ),
          const SizedBox(height: 4,),
          Container(
            margin: EdgeInsets.fromLTRB(65, 0, 65, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('By signing up, you agree to',style: TextStyle(color: Color(0xff777777),fontSize: 18),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('our',style: TextStyle(color: Color(0xff777777),fontSize: 18),),
                const SizedBox(width: 4,),
                Text('Terms',style: TextStyle(color: Color(0xff1DA1F2),fontSize: 18),),
                const SizedBox(width: 4,),
                Text('Privacy Policy',style: TextStyle(color: Color(0xff1DA1F2),fontSize: 18),),
                const SizedBox(width: 4,),
                Text('and',style: TextStyle(color: Color(0xff777777),fontSize: 18),)
              ],
            ),
            Text('Cookie Use.',style: TextStyle(color: Color(0xff1DA1F2),fontSize: 18),),
            const SizedBox(height: 40,),
            Text('Have an account already?',style: TextStyle(fontSize: 20,color: Color(0xff777777)),),
            // Text('Log in',style: TextStyle(color: Color(0xff1DA1F2),fontSize: 20),),
            TextButton(
              onPressed:(){
                Navigator.of(context).pushNamed(LoginPage.routeName);
              } , 
              child: Text('Log in',style: TextStyle(color: Color(0xff1DA1F2),fontSize: 20))
              ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}