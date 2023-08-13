// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'mission_model.freezed.dart';
part 'mission_model.g.dart';

@freezed
class MissionModel with _$MissionModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MissionModel({
    String? missionName,
    String? missionId,
    List<String>? manufacturers,
    List<String>? payloadIds,
    String? wikipedia,
    String? website,
    String? twitter,
    String? description,
  }) = _MissionModel;

  factory MissionModel.fromJson(Map<String, dynamic> json) => _$MissionModelFromJson(json);
}
