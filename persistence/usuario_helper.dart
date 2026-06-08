import 'package:sqflite/sqflite.dart';

import '../models/usuario.dart';
import 'database_helper.dart';

class UsuarioHelper {
  static const tableName = "usuarios";
  static String get createScript => '''
  CREATE TABLE usuarios(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    email TEXT,
    senha TEXT
  )
  ''';

  Future<Usuario?> saveUsuario(Usuario usuario) async {
    Database? db = await DatabaseHelper().db;
    usuario.id = await db!.insert(tableName, usuario.toMap());
    return usuario;
  }

  Future<Usuario?> login(String email, String senha) async {
    Database? db = await DatabaseHelper().db;
    List<Map> result = await db!.query(
      tableName,
      where: "email = ? AND senha = ?",
      whereArgs: [email, senha],
    );
    if (result.isNotEmpty) {
      return Usuario.fromMap(result.first);
    }
    return null;
  }
}
