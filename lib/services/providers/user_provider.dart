import 'package:flutter/material.dart';

class User {
  String name;
  String email;
  String password;

  User({
    required this.name,
    required this.email,
    required this.password,
  });
}

class UserProvider extends ChangeNotifier {
  User? _user; // Estado privado del usuario

  // Método para obtener el usuario
  User? getUser() {
    return _user;
  }

  // Método para setear el usuario
  void setUser(String name, String email, String password) {
    _user = User(name: name, email: email, password: password);
    notifyListeners(); // Notifica a los widgets que dependan de este estado
  }
}
