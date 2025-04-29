import 'package:flutter_test/flutter_test.dart';
import 'package:qrscan/data/datasource/scan_dao.dart';
import 'package:qrscan/data/models/scan_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

void main() {
  sqfliteFfiInit(); // Inicializa el soporte FFI de SQLite
  late Database db;
  late ScanDao dao;

  setUp(() async {
    databaseFactory = databaseFactoryFfi;
    final dbPath = join(await databaseFactory.getDatabasesPath(), 'test_scans.db');

    // Borrar base de datos antes de cada prueba
    await databaseFactory.deleteDatabase(dbPath);

    db = await databaseFactory.openDatabase(dbPath, options: OpenDatabaseOptions(
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE scans (
            id INTEGER PRIMARY KEY,
            content_base64 TEXT,
            scanned_at TEXT
          )
        ''');
      },
    ));

    dao = ScanDao(db);
  });

  tearDown(() async {
    await db.close();
  });

  test('insertScan y getScans', () async {
    final now = DateTime.now();
    final scan = ScanModel(id: 1, contentBase64: 'cGluZyBjb2Rl', scannedAt: now);

    await dao.insertScan(scan);

    final scans = await dao.getScans();

    expect(scans.length, 1);
    expect(scans.first.id, 1);
    expect(scans.first.contentBase64, 'cGluZyBjb2Rl');
    expect(scans.first.scannedAt.toIso8601String(), now.toIso8601String());
  });

  test('deleteScan', () async {
    final scan = ScanModel(
      id: 1,
      contentBase64: 'cGluZyBjb2Rl',
      scannedAt: DateTime.now(),
    );

    await dao.insertScan(scan);

    var scans = await dao.getScans();
    expect(scans.length, 1);

    await dao.deleteScan(1);

    scans = await dao.getScans();
    expect(scans.length, 0);
  });
}
