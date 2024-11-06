import 'package:cacao_boardgame_helper/features/splash/presentation/providers/splash_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final databaseProvider = FutureProvider<Isar>((ref) async {
  final initializationRepository = ref.read(initializationRepositoryProvider);
  return initializationRepository.getDatabase();
});
