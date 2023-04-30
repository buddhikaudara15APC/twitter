import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/providers/auth.dart';
import 'package:twitter_app/screens/home_page.dart';

import '../helpers/firebase_auth.dart';
import '../helpers/validator.dart';

// enum AuthMode { Signup, Login }

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
static const routeName = 'Register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
  //     Provider.of<Auth>(context,listen: false).signup(_authData['email']!,_authData['password']!);
  //   // }
    
  //   // setState(() {
  //   //   _isLoading = false;
  //   // });
  // }
  final _registerFormKey = GlobalKey<FormState>();

final _nameTextController = TextEditingController();
final _emailTextController = TextEditingController();
final _passwordTextController = TextEditingController();

final _focusName = FocusNode();
final _focusEmail = FocusNode();
final _focusPassword = FocusNode();

bool _isProcessing = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _focusName.unfocus();
      _focusEmail.unfocus();
      _focusPassword.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _registerFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.003,),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    child: const Icon(Icons.arrow_back,size: 30,color:Color(0xff171412) ,)
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
                child: const Text('Create your\naccount',style:TextStyle(fontSize: 40,fontWeight: FontWeight.w900) ,
                ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                // Container(
                //   margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                //   padding: EdgeInsets.all(10),
                //   height: MediaQuery.of(context).size.height*0.08,
                //   width: MediaQuery.of(context).size.width*0.85,
                //   decoration: BoxDecoration(
                //     border: Border.all(width: 1,color: Color(0xff777777) ),
                //     borderRadius: BorderRadius.circular(6)
                //   ),
                //   child: Center(
                //     child:TextFormField(
                //       keyboardType: TextInputType.emailAddress,
                //       style: TextStyle(
                //         fontSize: 23,
                //         color: Color(0xff777777)
                //       ),
                //   decoration: InputDecoration(
                //     labelText: 'Name',
                //   ),
                //     ),
                //     ),
                // ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
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
                    labelText: 'Email',
                  ),
                  // validator: (value) {
                  //     if (value!.isEmpty || !value.contains('@')) {
                  //       return 'Invalid email!';
                  //     }
                  //     return null;
                  //     return null;
                  //   },
                  //   onSaved: (value) {
                  //     _authData['email'] = value!;
                  //   },
                    ),
                    ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
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
                  //   onSaved: (value) {
                  //     _authData['password'] = value!;
                  //   },
                    ),
                    ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                _isProcessing
                    ? CircularProgressIndicator()
                    :Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.width*0.85,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Color(0xff777777) ),
                    borderRadius: BorderRadius.circular(60),
                    color:Color(0xff1DA1F2) 
                  ),
                  child: Center(
                    child:TextButton(
                      onPressed: () async {
                              setState(() {
                                _isProcessing = true;
                              });

                              if (_registerFormKey.currentState!
                                  .validate()) {
                                User? user = await FirebaseAuthHelper
                                    .registerUsingEmailPassword(
                                  // name: _nameTextController.text,
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
                                    // ModalRoute.withName('/'),
                                  );
                                }
                              }else{
                                setState(() {
                                  _isProcessing = false;
                                });
                              }
                            }, 
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Colors.white),
                        ),
                      ),
                    ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}