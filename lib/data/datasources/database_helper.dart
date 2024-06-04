import 'package:hotel_sunshine/data/model/reservation_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'local_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
  }

  Future<void> _createTables(Database db, int version) async {
    await db.execute('''
        CREATE TABLE IF NOT EXISTS reservation (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          suiteName TEXT,
          startDate TEXT,
          endDate TEXT,
          finalPrice DOUBLE
        )
      ''');
  }

  Future<void> insertReservation(ReservationModel reservation) async {
    final db = await database;
    await db.insert(
      'reservation',
      reservation.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ReservationModel>> getReservations() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('reservation');

    return List.generate(maps.length, (i) {
      return ReservationModel(
        id: maps[i]['id'],
        suiteName: maps[i]['suiteName'],
        startDate: DateTime.parse(maps[i]['startDate']),
        endDate: DateTime.parse(maps[i]['endDate']),
        finalPrice: maps[i]['finalPrice'],
      );
    });
  }

  Future<void> deleteReservation(int id) async {
    final db = await database;
    await db.delete(
      'reservation',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
