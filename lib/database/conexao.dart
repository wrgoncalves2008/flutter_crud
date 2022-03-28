import 'package:flutter_crud/database/sql_contatos.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Conexao {
  Conexao._();
  static Database? _database;

  static final Conexao _conexao = Conexao._();

  factory Conexao() {
    return _conexao;
  }

  get database async {
    if (_database != null) return _database;

    return await _inicializarBanco();
  }

  _inicializarBanco() async {
    return await openDatabase(join(await getDatabasesPath(), 'contatos.db'),
        version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(criatabela);
  }
}
