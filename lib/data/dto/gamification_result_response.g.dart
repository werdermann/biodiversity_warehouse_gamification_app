// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamification_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GamificationResultResponse _$$_GamificationResultResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GamificationResultResponse(
      gainedPoints: json['gainedPoints'] as int? ?? 0,
      newUnlockedBadges: (json['newUnlockedBadges'] as List<dynamic>?)
              ?.map((e) => UnlockedBadge.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hasNewLeaderboardPosition:
          json['hasNewLeaderboardPosition'] as bool? ?? false,
      leaderboard: json['leaderboard'] == null
          ? null
          : LeaderboardResponse.fromJson(
              json['leaderboard'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GamificationResultResponseToJson(
        _$_GamificationResultResponse instance) =>
    <String, dynamic>{
      'gainedPoints': instance.gainedPoints,
      'newUnlockedBadges': instance.newUnlockedBadges,
      'hasNewLeaderboardPosition': instance.hasNewLeaderboardPosition,
      'leaderboard': instance.leaderboard,
      'user': instance.user,
    };
