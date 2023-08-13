// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RocketModel _$$_RocketModelFromJson(Map<String, dynamic> json) =>
    _$_RocketModel(
      id: json['id'] as int?,
      active: json['active'] as bool?,
      stages: json['stages'] as int?,
      boosters: json['boosters'] as int?,
      costPerLaunch: json['cost_per_launch'] as int?,
      successRatePct: (json['success_rate_pct'] as num?)?.toDouble(),
      firstFlight: json['first_flight'] as String?,
      country: json['country'] as String?,
      company: json['company'] as String?,
      height: json['height'] == null
          ? null
          : RocketHeight.fromJson(json['height'] as Map<String, dynamic>),
      diameter: json['diameter'] == null
          ? null
          : Diameter.fromJson(json['diameter'] as Map<String, dynamic>),
      mass: json['mass'] == null
          ? null
          : Mass.fromJson(json['mass'] as Map<String, dynamic>),
      payloadWeights: (json['payload_weights'] as List<dynamic>?)
          ?.map((e) => PayloadWeight.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstStage: json['first_stage'] == null
          ? null
          : FirstStage.fromJson(json['first_stage'] as Map<String, dynamic>),
      secondStage: json['second_stage'] == null
          ? null
          : SecondStage.fromJson(json['second_stage'] as Map<String, dynamic>),
      engines: json['engines'] == null
          ? null
          : Engines.fromJson(json['engines'] as Map<String, dynamic>),
      landingLegs: json['landing_legs'] == null
          ? null
          : LandingLegs.fromJson(json['landing_legs'] as Map<String, dynamic>),
      wikipedia: json['wikipedia'] as String?,
      description: json['description'] as String?,
      rocketId: json['rocket_id'] as String?,
      rocketName: json['rocket_name'] as String?,
      rocketType: json['rocket_type'] as String?,
    );

Map<String, dynamic> _$$_RocketModelToJson(_$_RocketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'stages': instance.stages,
      'boosters': instance.boosters,
      'cost_per_launch': instance.costPerLaunch,
      'success_rate_pct': instance.successRatePct,
      'first_flight': instance.firstFlight,
      'country': instance.country,
      'company': instance.company,
      'height': instance.height,
      'diameter': instance.diameter,
      'mass': instance.mass,
      'payload_weights': instance.payloadWeights,
      'first_stage': instance.firstStage,
      'second_stage': instance.secondStage,
      'engines': instance.engines,
      'landing_legs': instance.landingLegs,
      'wikipedia': instance.wikipedia,
      'description': instance.description,
      'rocket_id': instance.rocketId,
      'rocket_name': instance.rocketName,
      'rocket_type': instance.rocketType,
    };

_$_RocketHeight _$$_RocketHeightFromJson(Map<String, dynamic> json) =>
    _$_RocketHeight(
      meters: (json['meters'] as num?)?.toDouble(),
      feet: (json['feet'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_RocketHeightToJson(_$_RocketHeight instance) =>
    <String, dynamic>{
      'meters': instance.meters,
      'feet': instance.feet,
    };

_$_Diameter _$$_DiameterFromJson(Map<String, dynamic> json) => _$_Diameter(
      meters: (json['meters'] as num?)?.toDouble(),
      feet: (json['feet'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_DiameterToJson(_$_Diameter instance) =>
    <String, dynamic>{
      'meters': instance.meters,
      'feet': instance.feet,
    };

_$_Mass _$$_MassFromJson(Map<String, dynamic> json) => _$_Mass(
      kg: json['kg'] as int?,
      lb: json['lb'] as int?,
    );

Map<String, dynamic> _$$_MassToJson(_$_Mass instance) => <String, dynamic>{
      'kg': instance.kg,
      'lb': instance.lb,
    };

_$_PayloadWeight _$$_PayloadWeightFromJson(Map<String, dynamic> json) =>
    _$_PayloadWeight(
      id: json['id'] as String?,
      name: json['name'] as String?,
      kg: json['kg'] as int?,
      lb: json['lb'] as int?,
    );

Map<String, dynamic> _$$_PayloadWeightToJson(_$_PayloadWeight instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'kg': instance.kg,
      'lb': instance.lb,
    };

_$_FirstStage _$$_FirstStageFromJson(Map<String, dynamic> json) =>
    _$_FirstStage(
      reusable: json['reusable'] as bool?,
      engines: json['engines'] as int?,
      fuelAmountTons: (json['fuel_amount_tons'] as num?)?.toDouble(),
      burnTimeSec: json['burn_time_sec'] as int?,
      thrustSeaLevel: json['thrust_sea_level'] == null
          ? null
          : Thrust.fromJson(json['thrust_sea_level'] as Map<String, dynamic>),
      thrustVacuum: json['thrust_vacuum'] == null
          ? null
          : Thrust.fromJson(json['thrust_vacuum'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FirstStageToJson(_$_FirstStage instance) =>
    <String, dynamic>{
      'reusable': instance.reusable,
      'engines': instance.engines,
      'fuel_amount_tons': instance.fuelAmountTons,
      'burn_time_sec': instance.burnTimeSec,
      'thrust_sea_level': instance.thrustSeaLevel,
      'thrust_vacuum': instance.thrustVacuum,
    };

_$_SecondStage _$$_SecondStageFromJson(Map<String, dynamic> json) =>
    _$_SecondStage(
      engines: json['engines'] as int?,
      fuelAmountTons: (json['fuel_amount_tons'] as num?)?.toDouble(),
      burnTimeSec: json['burn_time_sec'] as int?,
      thrust: json['thrust'] == null
          ? null
          : Thrust.fromJson(json['thrust'] as Map<String, dynamic>),
      payloads: json['payloads'] == null
          ? null
          : Payloads.fromJson(json['payloads'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SecondStageToJson(_$_SecondStage instance) =>
    <String, dynamic>{
      'engines': instance.engines,
      'fuel_amount_tons': instance.fuelAmountTons,
      'burn_time_sec': instance.burnTimeSec,
      'thrust': instance.thrust,
      'payloads': instance.payloads,
    };

_$_Thrust _$$_ThrustFromJson(Map<String, dynamic> json) => _$_Thrust(
      kN: json['k_n'] as int?,
      lbf: json['lbf'] as int?,
    );

Map<String, dynamic> _$$_ThrustToJson(_$_Thrust instance) => <String, dynamic>{
      'k_n': instance.kN,
      'lbf': instance.lbf,
    };

_$_Payloads _$$_PayloadsFromJson(Map<String, dynamic> json) => _$_Payloads(
      option1: json['option1'] as String?,
      option2: json['option2'] as String?,
      compositeFairing: json['composite_fairing'] == null
          ? null
          : CompositeFairing.fromJson(
              json['composite_fairing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PayloadsToJson(_$_Payloads instance) =>
    <String, dynamic>{
      'option1': instance.option1,
      'option2': instance.option2,
      'composite_fairing': instance.compositeFairing,
    };

_$_CompositeFairing _$$_CompositeFairingFromJson(Map<String, dynamic> json) =>
    _$_CompositeFairing(
      height: json['height'] == null
          ? null
          : RocketHeight.fromJson(json['height'] as Map<String, dynamic>),
      diameter: json['diameter'] == null
          ? null
          : Diameter.fromJson(json['diameter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CompositeFairingToJson(_$_CompositeFairing instance) =>
    <String, dynamic>{
      'height': instance.height,
      'diameter': instance.diameter,
    };

_$_Engines _$$_EnginesFromJson(Map<String, dynamic> json) => _$_Engines(
      number: json['number'] as int?,
      type: json['type'] as String?,
      version: json['version'] as String?,
      layout: json['layout'] as String?,
      engineLossMax: json['engine_loss_max'] as int?,
      propellant1: json['propellant1'] as String?,
      propellant2: json['propellant2'] as String?,
      thrustSeaLevel: json['thrust_sea_level'] == null
          ? null
          : Thrust.fromJson(json['thrust_sea_level'] as Map<String, dynamic>),
      thrustVacuum: json['thrust_vacuum'] == null
          ? null
          : Thrust.fromJson(json['thrust_vacuum'] as Map<String, dynamic>),
      thrustToWeight: (json['thrust_to_weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_EnginesToJson(_$_Engines instance) =>
    <String, dynamic>{
      'number': instance.number,
      'type': instance.type,
      'version': instance.version,
      'layout': instance.layout,
      'engine_loss_max': instance.engineLossMax,
      'propellant1': instance.propellant1,
      'propellant2': instance.propellant2,
      'thrust_sea_level': instance.thrustSeaLevel,
      'thrust_vacuum': instance.thrustVacuum,
      'thrust_to_weight': instance.thrustToWeight,
    };

_$_LandingLegs _$$_LandingLegsFromJson(Map<String, dynamic> json) =>
    _$_LandingLegs(
      number: json['number'] as int?,
      material: json['material'] as String?,
    );

Map<String, dynamic> _$$_LandingLegsToJson(_$_LandingLegs instance) =>
    <String, dynamic>{
      'number': instance.number,
      'material': instance.material,
    };
