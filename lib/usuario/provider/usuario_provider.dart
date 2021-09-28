import 'package:flutter/material.dart';

class UsuarioProvider with ChangeNotifier {
  String _nombres = "";
  String _username = "";
  bool _estado = true;

  String get nombres => _nombres;

  set nombres(String nombres) {
    this._nombres = nombres;
    notifyListeners();
  }

  String get username => _username;

  set username(String username) {
    this._username = username;
    notifyListeners();
  }

  bool get estado => _estado;

  set estado(bool estado) {
    this._estado = estado;
    notifyListeners();
  }
}
