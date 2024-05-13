import 'package:flutter/material.dart';

class FormData with ChangeNotifier {
  String name = '';
  String email = '';

  void setName(String newName) {
    name = newName;
    notifyListeners();
  }

  void setEmail(String newEmail) {
    email = newEmail;
    notifyListeners();
  }

  void clear() {
    name = '';
    email = '';
    notifyListeners();
  }
}
