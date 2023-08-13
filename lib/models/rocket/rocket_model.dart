// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'rocket_model.freezed.dart';
part 'rocket_model.g.dart';

@freezed
class RocketModel with _$RocketModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RocketModel({
    int? id,
    bool? active,
    int? stages,
    int? boosters,
    int? costPerLaunch,
    double? successRatePct,
    String? firstFlight,
    String? country,
    String? company,
    RocketHeight? height,
    Diameter? diameter,
    Mass? mass,
    List<PayloadWeight>? payloadWeights,
    FirstStage? firstStage,
    SecondStage? secondStage,
    Engines? engines,
    LandingLegs? landingLegs,
    String? wikipedia,
    String? description,
    String? rocketId,
    String? rocketName,
    String? rocketType,
  }) = _RocketModel;

  factory RocketModel.fromJson(Map<String, dynamic> json) => _$RocketModelFromJson(json);
}

@freezed
class RocketHeight with _$RocketHeight {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RocketHeight({
    double? meters,
    double? feet,
  }) = _RocketHeight;

  factory RocketHeight.fromJson(Map<String, dynamic> json) => _$RocketHeightFromJson(json);
}

@freezed
class Diameter with _$Diameter {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Diameter({
    double? meters,
    double? feet,
  }) = _Diameter;

  factory Diameter.fromJson(Map<String, dynamic> json) => _$DiameterFromJson(json);
}

@freezed
class Mass with _$Mass {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Mass({
    int? kg,
    int? lb,
  }) = _Mass;

  factory Mass.fromJson(Map<String, dynamic> json) => _$MassFromJson(json);
}

@freezed
class PayloadWeight with _$PayloadWeight {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PayloadWeight({
    String? id,
    String? name,
    int? kg,
    int? lb,
  }) = _PayloadWeight;

  factory PayloadWeight.fromJson(Map<String, dynamic> json) => _$PayloadWeightFromJson(json);
}

@freezed
class FirstStage with _$FirstStage {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FirstStage({
    bool? reusable,
    int? engines,
    double? fuelAmountTons,
    int? burnTimeSec,
    Thrust? thrustSeaLevel,
    Thrust? thrustVacuum,
  }) = _FirstStage;

  factory FirstStage.fromJson(Map<String, dynamic> json) => _$FirstStageFromJson(json);
}

@freezed
class SecondStage with _$SecondStage {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SecondStage({
    int? engines,
    double? fuelAmountTons,
    int? burnTimeSec,
    Thrust? thrust,
    Payloads? payloads,
  }) = _SecondStage;

  factory SecondStage.fromJson(Map<String, dynamic> json) => _$SecondStageFromJson(json);
}

@freezed
class Thrust with _$Thrust {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Thrust({
    int? kN,
    int? lbf,
  }) = _Thrust;

  factory Thrust.fromJson(Map<String, dynamic> json) => _$ThrustFromJson(json);
}

@freezed
class Payloads with _$Payloads {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Payloads({
    String? option1,
    String? option2,
    CompositeFairing? compositeFairing,
  }) = _Payloads;

  factory Payloads.fromJson(Map<String, dynamic> json) => _$PayloadsFromJson(json);
}

@freezed
class CompositeFairing with _$CompositeFairing {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CompositeFairing({
    RocketHeight? height,
    Diameter? diameter,
  }) = _CompositeFairing;

  factory CompositeFairing.fromJson(Map<String, dynamic> json) => _$CompositeFairingFromJson(json);
}

@freezed
class Engines with _$Engines {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Engines({
    int? number,
    String? type,
    String? version,
    String? layout,
    int? engineLossMax,
    String? propellant1,
    String? propellant2,
    Thrust? thrustSeaLevel,
    Thrust? thrustVacuum,
    double? thrustToWeight,
  }) = _Engines;

  factory Engines.fromJson(Map<String, dynamic> json) => _$EnginesFromJson(json);
}

@freezed
class LandingLegs with _$LandingLegs {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LandingLegs({
    int? number,
    String? material,
  }) = _LandingLegs;

  factory LandingLegs.fromJson(Map<String, dynamic> json) => _$LandingLegsFromJson(json);
}
