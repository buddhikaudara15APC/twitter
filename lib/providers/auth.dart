// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Auth with ChangeNotifier{
//   String? _token;
//   DateTime? _expirydate;
//   String? _userId;

//   Future<void>signup(String email,String password)async{
//   const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyC_5KE0ZLHB9vXBVEBYefZarVNF33oPeHA';
//   final response = await http.post(Uri.parse(url),body:json.encode({"email":email,"password":password,"returnSecureToken":true}) );
//   print(json.decode(response.body));
//   }

//   Future<void>login(String email,String password)async{
//   const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyC_5KE0ZLHB9vXBVEBYefZarVNF33oPeHA';
//   final response = await http.post(Uri.parse(url),body:json.encode({"email":email,"password":password,"returnSecureToken":true}) );
//   print(json.decode(response.body));
//   }
// }