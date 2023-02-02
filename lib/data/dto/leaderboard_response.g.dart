// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LeaderboardResponse _$$_LeaderboardResponseFromJson(
        Map<String, dynamic> json) =>
    _$_LeaderboardResponse(
      currentPosition: json['currentPosition'] as int?,
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_LeaderboardResponseToJson(
        _$_LeaderboardResponse instance) =>
    <String, dynamic>{
      'currentPosition': instance.currentPosition,
      'users': instance.users,
    };
