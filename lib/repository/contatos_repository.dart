import 'package:flutter_crud/database/conexao.dart';
import 'package:flutter_crud/model/usuario.dart';
import 'package:sqflite/sqflite.dart';

class ContatosRepository {
  late Database _db;
  // final List<Usuario> _contatos = [];

  carregarBanco() async {
    _db = await Conexao().database;
  }

  ContatosRepository() {
    carregarBanco();
  }

  Future<List<Usuario>> contatos() async {
    List contato = await _db.query('contatos');

    return contato.map((e) {
      return Usuario.fromMap(e);
    }).toList();
  }

  Future<Usuario?> contato(String id) async {
    List<Map<String, dynamic>> user = await _db.query(
      'contatos',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (user.isNotEmpty) {
      return Usuario.fromMap(user.first);
    }

    return null;
  }

  void update(Usuario user) async {
    await _db.update(
      'contatos',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  void delete(Usuario user) async {
    await _db.delete(
      'contatos',
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }
}
