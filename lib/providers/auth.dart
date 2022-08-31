import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import '../models/http_exception.dart';
import 'package:http/http.dart' as http;

/*
FUNCTIONS
- Get token
- Check authentification based on the token
- Authenticate logic
- Sign up logic
- Sign in logic
- Log out logic
- Auto log out logic
- Auto log in logic
*/

class Auth with ChangeNotifier {
  String _token;
  DateTime _expireDate;
  String _userId;

  String get token {
    if (_expireDate != null &&
        _expireDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  bool get isAuth {
    return token != null;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(
      'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCfnfGmC9KwkmZw5HdZZwjxuZyW0K9jaVs',
    );
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
      debugPrint(response.body);
      final responseData = json.decode(response.body);

      //check error if exist,
      if (responseData['error'] != null) {
        print(responseData['error']['message']);
        throw HttpException(responseData['error']['message']);
      }

      //if no error,
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expireDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData['expiresIn']),
        ),
      );

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
