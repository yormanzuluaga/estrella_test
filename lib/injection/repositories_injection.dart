part of 'injection_container.dart';

void _initRepositoriesInjections() {
  sl.registerFactory<CharacterRepository>(() => CharacterRepositoryImpl(characterResource: sl()));
}
