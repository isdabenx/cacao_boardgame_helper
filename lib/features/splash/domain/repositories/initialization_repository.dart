import 'package:isar/isar.dart';

abstract class InitializationRepository {
  Future<void> initialize();
  Isar getDatabase();
}
