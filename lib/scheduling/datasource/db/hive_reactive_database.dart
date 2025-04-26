import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/datasource/constants.dart';

import 'db.dart';

@Singleton(as: IBaseDatabase)
class HiveDatabase implements IBaseDatabase {
  final String _boxName = hiveBoxName;
  late Box _box;

  HiveDatabase() {
    _init();
  }

  Future<void> _init() async {
    if (!Hive.isBoxOpen(_boxName)) {
      _box = await Hive.openBox(_boxName);
    } else {
      _box = Hive.box(_boxName);
    }
  }

  @override
  Future<void> create(
      {required String table, required MapWithId mapWithId}) async {
    try {
      await _init();
      final boxKey = _generateBoxKey(table, mapWithId.id);
      await _box.put(boxKey, mapWithId.map);
    } catch (e) {
      throw Exception('Failed to create data in table $table: $e');
    }
  }

  @override
  Future<void> delete({required String table, required String id}) async {
    try {
      await _init();
      final boxKey = _generateBoxKey(table, id);
      await _box.delete(boxKey);
    } catch (e) {
      throw Exception(
          'Failed to delete data with id $id from table $table: $e');
    }
  }

  @override
  Future<void> deleteMultiple(
      {required String table, required Iterable<String> ids}) async {
    try {
      await _init();
      final boxKeys = ids.map((id) => _generateBoxKey(table, id)).toList();
      await _box.deleteAll(boxKeys);
    } catch (e) {
      throw Exception('Failed to delete multiple data from table $table: $e');
    }
  }

  @override
  Future<void> dropTable({required String table}) async {
    try {
      await _init();
      final keysToDelete = _box.keys
          .where((key) => key.toString().startsWith('$table-'))
          .toList();
      await _box.deleteAll(keysToDelete);
    } catch (e) {
      throw Exception('Failed to drop table $table: $e');
    }
  }

  @override
  Future<Map<String, dynamic>?> read(
      {required String table, required String id}) async {
    try {
      await _init();
      final boxKey = _generateBoxKey(table, id);
      return _box
          .get(boxKey)
          .cast<String, dynamic>(); //Add cast to the dynamic map
    } catch (e) {
      throw Exception('Failed to read data with id $id from table $table: $e');
    }
  }

  String _generateBoxKey(String table, String id) {
    return '$table-$id';
  }

  @override
  Future<List<Map<String, dynamic>>> readAll({required String table}) async {
    try {
      await _init();
      final keys = _box.keys
          .where((key) => key.toString().startsWith('$table-'))
          .toList();
      final List values = keys.map((key) => _box.get(key)).toList();

      final List<Map<String, dynamic>> mapList = values
          .map((value) => value.cast<String, dynamic>() as Map<String, dynamic>)
          .toList();
      return mapList;
    } catch (e) {
      throw Exception('Failed to read all data from table $table: $e');
    }
  }

  @override
  Future<Map<String, dynamic>?> readWhere(
      {required String table,
      required String field,
      required String value}) async {
    try {
      final allData = _box.values
          .where((data) => data is Map<String, dynamic>)
          .cast<Map<String, dynamic>>()
          .toList();

      for (var data in allData) {
        if (data[field] == value) {
          return data;
        }
      }
      return null;
    } catch (e) {
      throw Exception('Failed to read data from table $table: $e');
    }
  }
}
