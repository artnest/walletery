// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class PasswordEntry {
  final int id;
  final String title;
  final String email;
  final String password;
  PasswordEntry({this.id, this.title, this.email, this.password});
  factory PasswordEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return PasswordEntry(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      password: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}password']),
    );
  }
  factory PasswordEntry.fromJson(Map<String, dynamic> json) {
    return PasswordEntry(
      id: json['id'] as int,
      title: json['title'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'email': email,
      'password': password,
    };
  }

  PasswordEntry copyWith(
          {int id, String title, String email, String password}) =>
      PasswordEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('PasswordEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      $mrjc($mrjc($mrjc(0, id.hashCode), title.hashCode), email.hashCode),
      password.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is PasswordEntry &&
          other.id == id &&
          other.title == title &&
          other.email == email &&
          other.password == password);
}

class $PasswordsTable extends Passwords
    with TableInfo<$PasswordsTable, PasswordEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $PasswordsTable(this._db, [this._alias]);
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    var cName = 'id';
    if (_alias != null) cName = '$_alias.$cName';
    return GeneratedIntColumn('id', $tableName, false, hasAutoIncrement: true);
  }

  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    var cName = 'title';
    if (_alias != null) cName = '$_alias.$cName';
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 6, maxTextLength: 10);
  }

  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    var cName = 'email';
    if (_alias != null) cName = '$_alias.$cName';
    return GeneratedTextColumn('email', $tableName, false,
        minTextLength: 6, maxTextLength: 30);
  }

  GeneratedTextColumn _password;
  @override
  GeneratedTextColumn get password => _password ??= _constructPassword();
  GeneratedTextColumn _constructPassword() {
    var cName = 'password';
    if (_alias != null) cName = '$_alias.$cName';
    return GeneratedTextColumn('password', $tableName, false,
        minTextLength: 6, maxTextLength: 48);
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, email, password];
  @override
  $PasswordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'passwords';
  @override
  final String actualTableName = 'passwords';
  @override
  bool validateIntegrity(PasswordEntry instance, bool isInserting) =>
      id.isAcceptableValue(instance.id, isInserting) &&
      title.isAcceptableValue(instance.title, isInserting) &&
      email.isAcceptableValue(instance.email, isInserting) &&
      password.isAcceptableValue(instance.password, isInserting);
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PasswordEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PasswordEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(PasswordEntry d,
      {bool includeNulls = false}) {
    final map = <String, Variable>{};
    if (d.id != null || includeNulls) {
      map['id'] = Variable<int, IntType>(d.id);
    }
    if (d.title != null || includeNulls) {
      map['title'] = Variable<String, StringType>(d.title);
    }
    if (d.email != null || includeNulls) {
      map['email'] = Variable<String, StringType>(d.email);
    }
    if (d.password != null || includeNulls) {
      map['password'] = Variable<String, StringType>(d.password);
    }
    return map;
  }

  @override
  $PasswordsTable createAlias(String alias) {
    return $PasswordsTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $PasswordsTable _passwords;
  $PasswordsTable get passwords => _passwords ??= $PasswordsTable(this);
  @override
  List<TableInfo> get allTables => [passwords];
}
