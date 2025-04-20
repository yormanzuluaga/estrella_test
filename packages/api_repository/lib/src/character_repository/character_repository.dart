import 'package:api_helper/api_helper.dart';
import 'package:dartz/dartz.dart';

abstract class CharacterRepository {
  Future<Either<ApiException, List<CharacterModel>>> getCharacter({
    Map<String, String>? headers,
  });
}
