import 'package:freezed_annotation/freezed_annotation.dart';

part 'gamification_config.freezed.dart';
part 'gamification_config.g.dart';

@freezed
class GamificationConfig with _$GamificationConfig {
  const GamificationConfig._();

  const factory GamificationConfig({
    @Default(false) @JsonKey() bool badgesActive,
    @Default(false) @JsonKey() bool leaderboardActive,
    @Default(false) @JsonKey() bool onBoardingActive,
  }) = _GamificationConfig;

  factory GamificationConfig.fromJson(Map<String, dynamic> json) =>
      _$GamificationConfigFromJson(json);

  /// Empty config represents no gamification.
  static const noGamification = GamificationConfig();
}
