import 'package:moor_flutter/moor_flutter.dart';

import 'password_entry.dart';

part 'database.g.dart';

@UseMoor(tables: [Passwords])
class Database extends _$Database {
  Database()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<PasswordEntry>> get allPasswordEntries {
    return select(passwords).get();
  }

  Future<int> createEntry(PasswordEntry entry) {
    return into(passwords).insert(entry);
  }

  Future<bool> updateEntry(PasswordEntry entry) {
    return update(passwords).replace(entry);
  }

  Future<int> deleteEntry(PasswordEntry entry) {
    return delete(passwords).delete(entry);
  }
}
