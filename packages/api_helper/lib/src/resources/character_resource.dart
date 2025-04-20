import 'dart:convert';
import 'dart:io';
import 'package:api_helper/api_helper.dart';
import 'package:either_dart/either.dart';

/// {@template example_resource}
/// An api resource to get the prompt terms.
/// {@endtemplate}
class CharacterResource {
  /// {@macro example_resource}
  CharacterResource({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  // ignore: unused_field
  final ApiClient _apiClient;

  /// Get /game/prompt/terms
  ///
  /// Returns a [List<String>].
  Future<Either<ApiException, List<CharacterModel>>> getCharacter({
    Map<String, String>? headers,
  }) async {
    final response = await _apiClient.get(
      'character',
      modifiedHeaders: headers,
    );

    if (response.statusCode == HttpStatus.ok) {
      final data = (jsonDecode(response.body)['results'] as List).map((e) => CharacterModel.fromJson(e)).toList();

      return Right(data);
    } else {
      return Left(
        ApiException(
          response.statusCode,
          response.body,
        ),
      );
    }
  }
}
