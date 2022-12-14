import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../screens/screens.dart';
import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  bool isLoading = false;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyASlTXHFZ_CK9LkkcIWPr1qOaOLHt4IzeA');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      print(json.decode(response.body));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> submit(
      context, formKey, emailController, passwordController) async {
    if (!formKey.currentState!.validate()) {
      // Invalid!
      return;
    }

    // setState(() {
    isLoading = true;
    // });

    await signup(emailController.text.trim(), passwordController.text.trim());

    isLoading = false;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => MyLogin()));

    // setState(() {

    notifyListeners();
    // });
  }

  Future<void> authinticate(
      context, formKey, emailController, passwordController) async {
    if (!formKey.currentState!.validate()) {
      // Invalid!
      return;
    }

    // setState(() {
    isLoading = true;
    // });

    await login(emailController.text.trim(), passwordController.text.trim());

    isLoading = false;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => NavScreen()));

    // setState(() {

    notifyListeners();
    // });
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
