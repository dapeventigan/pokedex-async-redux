import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/ability_details.dart';

part 'ability.freezed.dart';
part 'ability.g.dart';

@freezed
class PokemonAbilities with _$PokemonAbilities {
  const factory PokemonAbilities({
    @JsonKey(name: 'ability') required AbilityDetails ability,
  }) = _PokemonAbilities;

  factory PokemonAbilities.fromJson(Map<String, dynamic> json) => _$PokemonAbilitiesFromJson(json);
}
