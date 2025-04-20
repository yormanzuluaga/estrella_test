part of 'injection_container.dart';

void _initResourcesInjections() {
  sl.registerFactory<CharacterResource>(() => CharacterResource(
        apiClient: sl(),
      ));
}
