import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_crud/model/usuario.dart';

class ControllerUsuarios with ChangeNotifier {
  final Map<String, Usuario> _usuarios = {}; // = {...fakeUsuarios};

  List<Usuario> get all {
    return [..._usuarios.values];
  }

  int get count {
    return _usuarios.length;
  }

  Usuario getUsuario(int idx) {
    return _usuarios.values.elementAt(idx);
  }

  void update(Usuario user) {
    if (_usuarios.containsKey(user.id)) {
      _usuarios.update(user.id!, (value) => value = user);
    }

    notifyListeners();
  }

  void add(Usuario user) {
    user.id = Random().nextDouble().toString();

    _usuarios.putIfAbsent(
        user.id!,
        () => Usuario(
            id: user.id,
            nome: user.nome,
            email: user.email,
            avatarUrl: user.avatarUrl));

    notifyListeners();
  }

  void remove(Usuario user) {
    _usuarios.remove(user.id);

    notifyListeners();
  }
}
