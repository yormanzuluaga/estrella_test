import 'package:get/get.dart';
import 'package:api_repository/api_repository.dart';
import 'package:api_helper/api_helper.dart';

class CharacterController extends GetxController {
  final CharacterRepository characterRepository;

  // Estado reactivo
  final RxList<CharacterModel> listCharacter = <CharacterModel>[].obs;
  final RxList<CharacterModel> abovelistCharacter = <CharacterModel>[].obs;
  final RxList<CharacterModel> listCharacterSaved = <CharacterModel>[].obs;
  final RxBool isLoading = false.obs;
  final Rxn<ApiException> error = Rxn<ApiException>();

  CharacterController({required this.characterRepository});

  @override
  void onInit() {
    super.onInit();
    getPlanet();
  }

  // Métodos
  Future<void> getPlanet({Map<String, String>? headers}) async {
    isLoading.value = true;

    final result = await characterRepository.getCharacter(headers: headers);

    result.fold(
      (err) {
        error.value = err;
        isLoading.value = false;
      },
      (characters) {
        listCharacter.value = characters;
        abovelistCharacter.value = characters; // Guardamos la lista original
        isLoading.value = false;
      },
    );

    isLoading.value = false;
  }

  void searchPlanet(String query) {
    if (query.isEmpty) {
      listCharacter.value = abovelistCharacter;
      return;
    }

    final filtered = abovelistCharacter.where((character) {
      return character.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
    }).toList();

    listCharacter.value = filtered;
  }

  void resetSearch() {
    listCharacter.value = abovelistCharacter;
  }
}
