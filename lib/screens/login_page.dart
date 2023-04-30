import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:twitter_app/screens/home_page.dart';
import 'package:twitter_app/screens/splash_screen2.dart';
import 'package:provider/provider.dart';

import '../helpers/firebase_auth.dart';
import '../helpers/validator.dart';
import '../providers/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
static const routeName = 'Login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final GlobalKey<FormState> _formKey = GlobalKey();
  // // AuthMode _authMode = AuthMode.Login;
  // Map<String, String> _authData = {
  //   'email': '',
  //   'password': '',
  // };
  // // var _isLoading = false;
  // final _passwordController = TextEditingController();
  // Future<void> _submit()async{
  //   if (!_formKey.currentState!.validate()) {
  //     // Invalid!
  //     return;
  //   }
  //   _formKey.currentState!.save();
  //   // setState(() {
  //   //   _isLoading = true;
  //   // });
  //   // if (_authMode == AuthMode.Login) {
  //   //   // Provider.of<Auth>(context,listen: false).login(_authData['email']!,_authData['password']!);
  //   // } else {
  //     Provider.of<Auth>(context,listen: false).login(_authData['email']!,_authData['password']!);
  //   // }
    
  //   // setState(() {
  //   //   _isLoading = false;
  //   // });
  // }
  final _formKey = GlobalKey<FormState>();

final _emailTextController = TextEditingController();
final _passwordTextController = TextEditingController();

final _focusEmail = FocusNode();
final _focusPassword = FocusNode();

bool _isProcessing = false;

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();

  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomePage(
          user: user,
        ),
      ),
    );
  }

  return firebaseApp;
}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _focusEmail.unfocus();
      _focusPassword.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child: FutureBuilder(
            future: _initializeFirebase(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
              return Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0,top: 48),
                child: Form(
                  key: _formKey,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width*0.003,),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pushNamed(SplashScreen2.routeName);
                          }, 
                          child: const Icon(Icons.close,size: 30,color:Color(0xff171412) ,)
                          ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Container(
                                  margin: const EdgeInsets.only(left: 40),
                                  padding: const EdgeInsets.all(10),
                                  height: 50,
                                  width: 50,
                                  child: Image.asset('assets/images/t4.png',fit: BoxFit.cover,)
                                  ),
                             ],
                           ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: const Text('To get started,first\nenter your phone,\nemail address or\n@username',style:TextStyle(fontSize: 30,fontWeight: FontWeight.w900) ,
                      ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height*0.08,
                        width: MediaQuery.of(context).size.width*0.85,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Color(0xff777777) ),
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Center(
                          child:TextFormField(
                            controller: _emailTextController,
                              focusNode: _focusEmail,
                              validator: (value) => Validator.validateEmail(
                                email: value,
                              ),
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              fontSize: 23,
                              color: Color(0xff777777)
                            ),
                        decoration: InputDecoration(
                          labelText: 'Phone,email address,...',
                        ),
                        // validator: (value) {
                        //     if (value!.isEmpty || !value.contains('@')) {
                        //       return 'Invalid email!';
                        //     }
                        //     return null;
                        //     return null;
                        //   },
                          // onSaved: (value) {
                          //   _authData['email'] = value!;
                          // },
                          ),
                          ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                      Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: const Text('Enter your password',style:TextStyle(fontSize: 30,fontWeight: FontWeight.w900) ,
                      ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height*0.08,
                        width: MediaQuery.of(context).size.width*0.85,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Color(0xff777777) ),
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Center(
                          child:TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _passwordTextController,
                              focusNode: _focusPassword,
                              obscureText: true,
                              validator: (value) => Validator.validatePassword(
                                password: value,
                              ),
                            style: TextStyle(
                              fontSize: 23,
                              color: Color(0xff777777)
                            ),
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        // validator: (value) {
                        //     if (value!.isEmpty || value.length < 5) {
                        //       return 'Password is too short!';
                        //     }
                        //   },
                          // onSaved: (value) {
                          //   _authData['password'] = value!;
                          // },
                          ),
                          ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.3,),
                            
                            
                            
                      _isProcessing
                            ? CircularProgressIndicator()
                            :Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.06,
                            width: MediaQuery.of(context).size.width*0.55,
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Color(0xff777777)),
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child:TextButton(
                              onPressed: (){}, 
                              child: Text('Forgot password?',style: TextStyle(color: Color(0xff171412),fontSize: 20,fontWeight: FontWeight.w900))
                              ) ,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.06,
                            width: MediaQuery.of(context).size.width*0.25,
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Color(0xff777777)),
                              borderRadius: BorderRadius.circular(50),
                              color:Color(0xff777777) 
                            ),
                            child:TextButton(
                              onPressed: () async {
                                      _focusEmail.unfocus();
                                      _focusPassword.unfocus();
                        
                                      if (_formKey.currentState!
                                          .validate()) {
                                        setState(() {
                                          _isProcessing = true;
                                        });
                        
                                        User? user = await FirebaseAuthHelper
                                            .signInUsingEmailPassword(
                                          email: _emailTextController.text,
                                          password:
                                              _passwordTextController.text,
                                        );
                        
                                        setState(() {
                                          _isProcessing = false;
                                        });
                        
                                        if (user != null) {
                                          Navigator.of(context)
                                              .push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage(user: user),
                                            ),
                                          );
                                        }
                                      }
                                    }, 
                              child: Text(
                                'Log in'
                                ,style: TextStyle(color: Color(0xff171412),fontSize: 20,fontWeight: FontWeight.w900))
                              ) ,
                          ),
                        ],
                      ),
                  ],
                              ),
                ),
                );
             },
            
          ),
        ),
      ),
    );
  }
}



