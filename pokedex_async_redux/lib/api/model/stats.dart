import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/stats_details.dart';

part 'stats.freezed.dart';
part 'stats.g.dart';

@freezed
class PokemonStats with _$PokemonStats {
  const factory PokemonStats({
    @JsonKey(name: 'base_stat') required double baseStat,
    @JsonKey(name: 'stat') required StatsDetails stat,
  }) = _PokemonStats;

  factory PokemonStats.fromJson(Map<String, dynamic> json) => _$PokemonStatsFromJson(json);
}
