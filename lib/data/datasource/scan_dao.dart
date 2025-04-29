import 'package:qrscan/data/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class ScanDao {
  final Database db;

  ScanDao(this.db);

  Future<void> insertScan(ScanModel scan) async {
    await db.insert('scans', scan.toMap());
  }

  Future<List<ScanModel>> getScans() async {
    final result = await db.query('scans', orderBy: 'scanned_at DESC');
    return result.map((e) => ScanModel.fromMap(e)).toList();
  }

  Future<void> deleteScan(int id) async {
    await db.delete('scans', where: 'id = ?', whereArgs: [id]);
  }
}