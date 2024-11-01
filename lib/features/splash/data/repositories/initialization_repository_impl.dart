import 'package:cacao_boardgame_helper/features/splash/domain/repositories/initialization_repository.dart';

class InitializationRepositoryImpl implements InitializationRepository {
  @override
  Future<void> initialize() async {
    await Future.delayed(Duration(seconds: 12));
  }
}
