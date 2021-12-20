import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = 'Dictionary.db';
  static const _databaseVersion = 1;
  static const table = 'entries';
  static const colWord = 'word';
  static const colWordType = 'wordtype';
  static const colDefinition = 'definition';
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return database;
    }
  }

  _intiDatabase() async {
    String? databasePath = getDatabasesPath() as String?;
    String path = join(databasePath!, _databaseName);
    var exist = await databaseExists(path);
    if (!exist) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join("asset", _databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Openning existing database");
    }
    return await openDatabase(path, version: _databaseVersion);
  }

  Future<List> getAllWord() async {
    var db = await instance.database;
    var result = await db!.query(table);
    return result.toList();
  }
}
