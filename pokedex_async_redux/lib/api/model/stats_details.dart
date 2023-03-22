import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_details.freezed.dart';
part 'stats_details.g.dart';

@freezed
class StatsDetails with _$StatsDetails {
  const factory StatsDetails({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _StatsDetails;

  factory StatsDetails.fromJson(Map<String, dynamic> json) => _$StatsDetailsFromJson(json);
}
