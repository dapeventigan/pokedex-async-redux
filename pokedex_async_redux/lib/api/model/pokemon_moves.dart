import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_moves.freezed.dart';
part 'pokemon_moves.g.dart';

@freezed
class PokemonMoves with _$PokemonMoves {
  const factory PokemonMoves({
    @JsonKey(name: 'move') required MovesDetails move,
  }) = _PokemonMove;

  factory PokemonMoves.fromJson(Map<String, dynamic> json) => _$PokemonMovesFromJson(json);
}

@freezed
class MovesDetails with _$MovesDetails {
  const factory MovesDetails({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _MovesDetails;

  factory MovesDetails.fromJson(Map<String, dynamic> json) => _$MovesDetailsFromJson(json);
}
