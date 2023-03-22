import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/moves_details.dart';

part 'moves.freezed.dart';
part 'moves.g.dart';

@freezed
class PokemonMoves with _$PokemonMoves {
  const factory PokemonMoves({
    @JsonKey(name: 'move') required MovesDetails move,
  }) = _PokemonMove;

  factory PokemonMoves.fromJson(Map<String, dynamic> json) => _$PokemonMovesFromJson(json);
}
