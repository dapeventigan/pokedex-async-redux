import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_abilities.freezed.dart';
part 'pokemon_abilities.g.dart';

@freezed
class PokemonAbilities with _$PokemonAbilities {
  const factory PokemonAbilities({
    @JsonKey(name: 'ability') required AbilityDetails ability,
  }) = _PokemonAbilities;

  factory PokemonAbilities.fromJson(Map<String, dynamic> json) => _$PokemonAbilitiesFromJson(json);
}

@freezed
class AbilityDetails with _$AbilityDetails {
  const factory AbilityDetails({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _AbilityDetails;

  factory AbilityDetails.fromJson(Map<String, dynamic> json) => _$AbilityDetailsFromJson(json);
}
