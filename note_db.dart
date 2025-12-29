import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteDb {
  NoteDb._();
  static final NoteDb instance = NoteDb._();

  static const _dbName = 'notes.db';
  static const _dbVersion = 1;

  static const table = 'notes';

  Database? _db;
}
