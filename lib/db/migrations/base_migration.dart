import 'package:sqflite/sqflite.dart';

abstract class Migration {
  Future<void> up(Database db);
}
