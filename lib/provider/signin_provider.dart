import 'package:flutter/foundation.dart';

class SigninProvider with ChangeNotifier {
  String _email = '';
  String _password = '';  

  String get email => _email;
  String get password => _password;

  bool get canSignIn => _email.isNotEmpty && _password.isNotEmpty;

  void updateEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void updatePassword(String value){
    _password = value;
    notifyListeners();
  }
}
