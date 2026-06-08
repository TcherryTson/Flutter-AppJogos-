import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'usuario_helper.dart';
import 'favorito_helper.dart';

class DatabaseHelper {
  Database? _db;
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper.internal();
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database?> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "gamevault.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(UsuarioHelper.createScript);
    await db.execute(FavoritoHelper.createScript);
  }
}
