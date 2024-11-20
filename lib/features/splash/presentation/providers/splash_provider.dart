import 'package:cacao_boardgame_helper/features/splash/data/repositories/initialization_repository_impl.dart';
import 'package:cacao_boardgame_helper/features/splash/domain/repositories/initialization_repository.dart';
import 'package:cacao_boardgame_helper/features/splash/domain/use_cases/initialize_app_use_case.dart';
import 'package:cacao_boardgame_helper/shared/providers/boardgame_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initializationRepositoryProvider = Provider<InitializationRepository>(
  (ref) => InitializationRepositoryImpl(),
);

final initializeAppUseCaseProvider = Provider<InitializeAppUseCase>(
  (ref) => InitializeAppUseCase(ref.watch(initializationRepositoryProvider)),
);

final splashScreenProvider = FutureProvider<void>((ref) async {
  final initializeAppUseCase = ref.read(initializeAppUseCaseProvider);
  await initializeAppUseCase.initialize();
  final boardgameNotifier = ref.read(boardgameNotifierProvider.notifier);
  await boardgameNotifier.initialize();
});
