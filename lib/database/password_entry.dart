import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('PasswordEntry')
class Passwords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 10)();
  TextColumn get email => text().withLength(min: 6, max: 30)();
  TextColumn get password => text().withLength(min: 6, max: 48)();
}
