import 'package:cacao_boardgame_helper/features/splash/domain/repositories/initialization_repository.dart';

class InitializeAppUseCase {
  final InitializationRepository repository;

  InitializeAppUseCase(this.repository);

  Future<void> initialize() async {
    await repository.initialize();
  }
}
