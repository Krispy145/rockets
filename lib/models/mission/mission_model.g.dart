// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MissionModel _$$_MissionModelFromJson(Map<String, dynamic> json) =>
    _$_MissionModel(
      missionName: json['mission_name'] as String?,
      missionId: json['mission_id'] as String?,
      manufacturers: (json['manufacturers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      payloadIds: (json['payload_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      wikipedia: json['wikipedia'] as String?,
      website: json['website'] as String?,
      twitter: json['twitter'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_MissionModelToJson(_$_MissionModel instance) =>
    <String, dynamic>{
      'mission_name': instance.missionName,
      'mission_id': instance.missionId,
      'manufacturers': instance.manufacturers,
      'payload_ids': instance.payloadIds,
      'wikipedia': instance.wikipedia,
      'website': instance.website,
      'twitter': instance.twitter,
      'description': instance.description,
    };
