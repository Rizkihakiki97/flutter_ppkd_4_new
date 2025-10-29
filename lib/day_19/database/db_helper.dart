// db_helper.dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user_model.dart';

class DbHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'user_data.db'),
      onCreate: (db, version) async {
        await db.execute('''
                CREATE TABLE $_tableName(
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  name TEXT,
                  email TEXT,
                  phone INTEGER,
                  password TEXT
                )
              ''');
      },

      version: 5,
    );
  }

  // static Database? _database;
  static const String _tableName = 'users';

  // static Future<Database?> get database async {
  //   if (_database != null) return _database;
  //   _database = await db();
  //   return _database;
  // }

  // static Future<Database> db() async {
  //   final dbPath = await getDatabasesPath();
  //   final path = join(dbPath, 'user_data.db');

  //   return await openDatabase(
  //     path,
  //     version: 1,
  //     onCreate: (db, version) async {
  //       await db.execute('''
  //         CREATE TABLE $_tableName(
  //           id INTEGER PRIMARY KEY AUTOINCREMENT,
  //           name TEXT,
  //           email TEXT,
  //           phone INTEGER,
  //           password TEXT
  //         )
  //       ''');
  //     },
  //   );
  // }

  //  Insert (Sudah ada di project kamu)
  static Future<void> registerUser(UserModel user) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.insert(
      _tableName,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(user.toMap());
  }

  static Future<UserModel?> loginUser({
    required String email,
    required String password,
    required int phone,
  }) async {
    final dbs = await db();
    //query adalah fungsi untuk menampilkan data (READ)
    final List<Map<String, dynamic>> results = await dbs.query(
      _tableName,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }
    return null;
  }

  //  Update Data

  static Future<void> updateUser(UserModel user) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.update(
      _tableName,
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(user.toMap());
  }

  static Future<void> deleteUser(int id) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.delete(_tableName, where: "id = ?", whereArgs: [id]);
  }
  //  Delete Data

  //  Get All Users
  static Future<List<UserModel>> getAllUsers() async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(_tableName);
    print(results.map((e) => UserModel.fromMap(e)).toList());
    return results.map((e) => UserModel.fromMap(e)).toList();
  }
}
