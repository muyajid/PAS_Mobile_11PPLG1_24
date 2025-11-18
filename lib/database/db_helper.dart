import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todo.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE product(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, category TEXT)',
        );
      },
    );
  }

  Future<int> markProduct(Map<String, dynamic> product) async {
    final client = await db;
    return await client.insert('product', product);
  }

  Future<int> deleteProduct(int id) async {
    final client = await db;
    return await client.delete('product', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getMarkProduct() async {
    final client = await db;
    return client.query('product');
  }
}
