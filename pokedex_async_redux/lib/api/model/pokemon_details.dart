import 'package:freezed_annotation/freezed_annotation.dart';
import 'models.dart';

part 'pokemon_details.freezed.dart';
part 'pokemon_details.g.dart';

@freezed
class PokemonDetails with _$PokemonDetails {
  const factory PokemonDetails({
    @JsonKey(name: 'abilities') required List<PokemonAbilities> abilities,
    @JsonKey(name: 'moves') required List<PokemonMoves> moves,
    @JsonKey(name: 'stats') required List<PokemonStats> stats,
    @JsonKey(name: 'height') required double height,
    @JsonKey(name: 'weight') required double weight,
    @JsonKey(name: 'base_experience') required double baseExperience,
  }) = _PokemonDetails;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => _$PokemonDetailsFromJson(json);
}
