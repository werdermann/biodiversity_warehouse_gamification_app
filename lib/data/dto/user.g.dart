// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int?,
      username: json['username'] as String?,
      isAdmin: json['isAdmin'] as bool? ?? false,
      points: json['points'] as int? ?? 0,
      unlockedBadges: (json['unlockedBadges'] as List<dynamic>?)
              ?.map((e) => UnlockedBadge.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lockedBadges: (json['lockedBadges'] as List<dynamic>?)
              ?.map((e) => LockedBadge.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'isAdmin': instance.isAdmin,
      'points': instance.points,
      'unlockedBadges': instance.unlockedBadges,
      'lockedBadges': instance.lockedBadges,
    };
