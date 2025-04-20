import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:dartz/dartz.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  CharacterResource characterResource;
  @override
  CharacterRepositoryImpl({
    required this.characterResource,
  });

  @override
  Future<Either<ApiException, List<CharacterModel>>> getCharacter({
    Map<String, String>? headers,
  }) async {
    final movieModel = await characterResource.getCharacter(
      headers: headers,
    );
    return movieModel.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
