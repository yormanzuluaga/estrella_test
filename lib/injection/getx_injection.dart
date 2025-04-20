part of 'injection_container.dart';

void _initGetxInjections() {
  Get.lazyPut<CharacterController>(
    () => CharacterController(
      characterRepository: sl(),
    ),
  );
}
