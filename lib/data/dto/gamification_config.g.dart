// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamification_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GamificationConfig _$$_GamificationConfigFromJson(
        Map<String, dynamic> json) =>
    _$_GamificationConfig(
      badgesActive: json['badgesActive'] as bool? ?? false,
      leaderboardActive: json['leaderboardActive'] as bool? ?? false,
      onBoardingActive: json['onBoardingActive'] as bool? ?? false,
    );

Map<String, dynamic> _$$_GamificationConfigToJson(
        _$_GamificationConfig instance) =>
    <String, dynamic>{
      'badgesActive': instance.badgesActive,
      'leaderboardActive': instance.leaderboardActive,
      'onBoardingActive': instance.onBoardingActive,
    };
