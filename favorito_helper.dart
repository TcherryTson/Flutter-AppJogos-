import 'package:sqflite/sqflite.dart';

import '../models/favorito.dart';
import 'database_helper.dart';

class FavoritoHelper {
  static const tableName = "favoritos";
  static String get createScript => '''
  CREATE TABLE favoritos(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    gameId INTEGER,
    title TEXT,
    thumbnail TEXT
  )
  ''';
  Future<Favorito?> saveFavorito(Favorito favorito) async {
    Database? db = await DatabaseHelper().db;
    favorito.id = await db!.insert(tableName, favorito.toMap());
    return favorito;
  }

  Future<List<Favorito>> getAll() async {
    Database? db = await DatabaseHelper().db;
    List<Map> result = await db!.query(tableName);
    List<Favorito> favoritos = [];
    for (Map item in result) {
      favoritos.add(Favorito.fromMap(item));
    }
    return favoritos;
  }

  Future<int> deleteFavorito(int id) async {
    Database? db = await DatabaseHelper().db;
    return await db!.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}
