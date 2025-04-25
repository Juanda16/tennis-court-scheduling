part of 'db.dart';

/// Data class to contain JSON data and id for info stored/retrieved into/from database
class MapWithId {
  /// Constructor receiving [id] and json [map]
  MapWithId({required this.id, required Map<String, dynamic> map})
      : map = Map<String, dynamic>.of(map);

  /// Id to identify item in database.
  final String id;

  /// Info to be written into item in database.
  final Map<String, dynamic> map;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MapWithId &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          const DeepCollectionEquality.unordered().equals(map, other.map);

  @override
  int get hashCode =>
      id.hashCode ^
      map.entries.fold(
          0,
          (int previousValue, MapEntry<String, dynamic> element) =>
              previousValue ^ element.key.hashCode ^ element.value.hashCode);
}

/// Class abstraction for allowing pagination.
class PaginatedDbMaps {
  final Iterable<Map<String, dynamic>> _documents;

  /// Object representing the query to be requested for retrieving next page.
  final Object? nextSkip;

  /// All the [Map<String, dynamic>] documents contained in current query page.
  Iterable<Map<String, dynamic>> get documents =>
      List<Map<String, dynamic>>.unmodifiable(_documents);

  /// Constructor receiving [documents] and [nextSkip]
  PaginatedDbMaps(
      {required Iterable<Map<String, dynamic>> documents, this.nextSkip})
      : _documents = documents;
}

/// Abstract class for modeling a reactive database.
///
/// It should return Streams prom read-only methods that update each time the read info is changed in the source db.
abstract class IBaseDatabase {
  /// Creates a new item in the database.
  ///
  /// New item is created in [table] with the info contained in [mapWithId] and its indexed by id field in [mapWithId].
  Future<void> create({
    required String table,
    required MapWithId mapWithId,
  });

  /// Deletes zero or one item in the database.
  ///
  /// The item is deleted from [table] and it's deleted by its [id].
  Future<void> delete({
    required String table,
    required String id,
  });

  /// Deletes zero or more items in the database depending on the received ids.
  ///
  /// All items with id inside [ids] are deleted from [table].
  /// In case [ids] is empty it will not delete a single item in [table].
  Future<void> deleteMultiple(
      {required String table, required Iterable<String> ids});

  /// Delete the store and its content from the [table]
  Future<void> dropTable({required String table});

  /// Reads zero or one item from the database.
  ///
  /// Item is read from [table] and it's matched by its [id].
  /// In case there's no matched item, returns null.
  Future<Map<String, dynamic>?> read({
    required String table,
    required String id,
  });

  Future<List<Map<String, dynamic>>> readAll({
    required String table,
  });
}
