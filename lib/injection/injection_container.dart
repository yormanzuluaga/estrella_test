// ignore_for_file: depend_on_referenced_packages

import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:estrella_test/feature/character/controller/character_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
part 'getx_injection.dart';
part 'network_injection.dart';
part 'repositories_injection.dart';
part 'resources_injection.dart';

/// Instance of the dependency injection container.
final sl = GetIt.instance;

/// Initialize the dependency injection container.
Future<void> init({
  required void Function(dynamic, StackTrace?)? onError,
}) async {
  //=======================
  // Network
  //=======================
  _initNetworkInjections(onError);

  //=======================
  // DataSource / Resources
  //=======================
  _initResourcesInjections();

  //=======================
  // Repositories
  //=======================
  _initRepositoriesInjections();

  //=======================
  // Blocs
  //=======================
  _initGetxInjections();
}
