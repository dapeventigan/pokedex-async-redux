import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_stats.freezed.dart';
part 'pokemon_stats.g.dart';

@freezed
class PokemonStats with _$PokemonStats {
  const factory PokemonStats({
    @JsonKey(name: 'base_stat') required double baseStat,
    @JsonKey(name: 'stat') required StatsDetails stat,
  }) = _PokemonStats;

  factory PokemonStats.fromJson(Map<String, dynamic> json) => _$PokemonStatsFromJson(json);
}

@freezed
class StatsDetails with _$StatsDetails {
  const factory StatsDetails({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _StatsDetails;

  factory StatsDetails.fromJson(Map<String, dynamic> json) => _$StatsDetailsFromJson(json);
}
