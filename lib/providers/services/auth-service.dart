// // class AuthService {
// //   // sign up user

// //   void signUpUser({
// //     required String email,
// //     required String pasword,
// //     required String name,
// //     required String username,
// //   }) async {
// //     try {} catch (e) {}
// //   }
// // }
// import 'dart:convert';

// import 'package:fbanime/screens/home_screen.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../constants/global-variables.dart';
// import '../../constants/utils.dart';
// import '../../models/constants/error-handling.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import '../../models/user.dart';
// import '../user-provider.dart';

// class AuthService {
//   // sign up user
//   void signUpUser({
//     required BuildContext context,
//     required String email,
//     required String password,
//     required String name,
//     required String username,
//   }) async {
//     try {
//       User user = User(
//         id: '',
//         name: name,
//         username: username,
//         password: password,
//         email: email,
//         token: '',
//       );

//       http.Response res = await http.post(
//         Uri.parse('$uri/api/signup'),
//         body: user.toJson(),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );

//       httpErrorHandling(
//         response: res,
//         context: context,
//         onSuccess: () {
//           showSnackBar(
//             context,
//             'Account created! Login with the same credentials!',
//           );
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }

//   // sign in user
//   void signInUser({
//     required BuildContext context,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       http.Response res = await http.post(
//         Uri.parse('$uri/api/signin'),
//         body: jsonEncode({
//           'email': email,
//           'password': password,
//         }),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//       httpErrorHandling(
//         response: res,
//         context: context,
//         onSuccess: () async {
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           Provider.of<UserProvider>(context, listen: false).setUser(res.body);
//           await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
//           Navigator.pushNamedAndRemoveUntil(
//               context, HomeScreen.routeName, (route) => false);
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }

//   // get user data

//   void getUserData(
//     BuildContext context,
//   ) async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('x-auth-token');

//       if (token == null) {
//         prefs.setString('x-auth-token', '');

//         var tokenRes = await http.post(
//           Uri.parse('$uri/tokenIsValid'),
//           headers: <String, String> {
//           }
//         );
//       }
//       // http.Response res = await http.post(
//       //   Uri.parse('$uri/api/signin'),
//       //   body: jsonEncode({
//       //     'email': email,
//       //     'password': password,
//       //   }),
//       //   headers: <String, String>{
//       //     'Content-Type': 'application/json; charset=UTF-8',
//       //   },
//       // );
//       // httpErrorHandling(
//       //   response: res,
//       //   context: context,
//       //   onSuccess: () async {
//       //     SharedPreferences prefs = await SharedPreferences.getInstance();
//       //     Provider.of<UserProvider>(context, listen: false).setUser(res.body);
//       //     await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
//       //     Navigator.pushNamedAndRemoveUntil(
//       //         context, HomeScreen.routeName, (route) => false);
//       //   },
//       // );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
// }
