// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MissionModel _$MissionModelFromJson(Map<String, dynamic> json) {
  return _MissionModel.fromJson(json);
}

/// @nodoc
mixin _$MissionModel {
  String? get missionName => throw _privateConstructorUsedError;
  String? get missionId => throw _privateConstructorUsedError;
  List<String>? get manufacturers => throw _privateConstructorUsedError;
  List<String>? get payloadIds => throw _privateConstructorUsedError;
  String? get wikipedia => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get twitter => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionModelCopyWith<MissionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionModelCopyWith<$Res> {
  factory $MissionModelCopyWith(
          MissionModel value, $Res Function(MissionModel) then) =
      _$MissionModelCopyWithImpl<$Res, MissionModel>;
  @useResult
  $Res call(
      {String? missionName,
      String? missionId,
      List<String>? manufacturers,
      List<String>? payloadIds,
      String? wikipedia,
      String? website,
      String? twitter,
      String? description});
}

/// @nodoc
class _$MissionModelCopyWithImpl<$Res, $Val extends MissionModel>
    implements $MissionModelCopyWith<$Res> {
  _$MissionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missionName = freezed,
    Object? missionId = freezed,
    Object? manufacturers = freezed,
    Object? payloadIds = freezed,
    Object? wikipedia = freezed,
    Object? website = freezed,
    Object? twitter = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      missionName: freezed == missionName
          ? _value.missionName
          : missionName // ignore: cast_nullable_to_non_nullable
              as String?,
      missionId: freezed == missionId
          ? _value.missionId
          : missionId // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturers: freezed == manufacturers
          ? _value.manufacturers
          : manufacturers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      payloadIds: freezed == payloadIds
          ? _value.payloadIds
          : payloadIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      wikipedia: freezed == wikipedia
          ? _value.wikipedia
          : wikipedia // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MissionModelCopyWith<$Res>
    implements $MissionModelCopyWith<$Res> {
  factory _$$_MissionModelCopyWith(
          _$_MissionModel value, $Res Function(_$_MissionModel) then) =
      __$$_MissionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? missionName,
      String? missionId,
      List<String>? manufacturers,
      List<String>? payloadIds,
      String? wikipedia,
      String? website,
      String? twitter,
      String? description});
}

/// @nodoc
class __$$_MissionModelCopyWithImpl<$Res>
    extends _$MissionModelCopyWithImpl<$Res, _$_MissionModel>
    implements _$$_MissionModelCopyWith<$Res> {
  __$$_MissionModelCopyWithImpl(
      _$_MissionModel _value, $Res Function(_$_MissionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missionName = freezed,
    Object? missionId = freezed,
    Object? manufacturers = freezed,
    Object? payloadIds = freezed,
    Object? wikipedia = freezed,
    Object? website = freezed,
    Object? twitter = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_MissionModel(
      missionName: freezed == missionName
          ? _value.missionName
          : missionName // ignore: cast_nullable_to_non_nullable
              as String?,
      missionId: freezed == missionId
          ? _value.missionId
          : missionId // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturers: freezed == manufacturers
          ? _value._manufacturers
          : manufacturers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      payloadIds: freezed == payloadIds
          ? _value._payloadIds
          : payloadIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      wikipedia: freezed == wikipedia
          ? _value.wikipedia
          : wikipedia // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_MissionModel implements _MissionModel {
  const _$_MissionModel(
      {this.missionName,
      this.missionId,
      final List<String>? manufacturers,
      final List<String>? payloadIds,
      this.wikipedia,
      this.website,
      this.twitter,
      this.description})
      : _manufacturers = manufacturers,
        _payloadIds = payloadIds;

  factory _$_MissionModel.fromJson(Map<String, dynamic> json) =>
      _$$_MissionModelFromJson(json);

  @override
  final String? missionName;
  @override
  final String? missionId;
  final List<String>? _manufacturers;
  @override
  List<String>? get manufacturers {
    final value = _manufacturers;
    if (value == null) return null;
    if (_manufacturers is EqualUnmodifiableListView) return _manufacturers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _payloadIds;
  @override
  List<String>? get payloadIds {
    final value = _payloadIds;
    if (value == null) return null;
    if (_payloadIds is EqualUnmodifiableListView) return _payloadIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? wikipedia;
  @override
  final String? website;
  @override
  final String? twitter;
  @override
  final String? description;

  @override
  String toString() {
    return 'MissionModel(missionName: $missionName, missionId: $missionId, manufacturers: $manufacturers, payloadIds: $payloadIds, wikipedia: $wikipedia, website: $website, twitter: $twitter, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MissionModel &&
            (identical(other.missionName, missionName) ||
                other.missionName == missionName) &&
            (identical(other.missionId, missionId) ||
                other.missionId == missionId) &&
            const DeepCollectionEquality()
                .equals(other._manufacturers, _manufacturers) &&
            const DeepCollectionEquality()
                .equals(other._payloadIds, _payloadIds) &&
            (identical(other.wikipedia, wikipedia) ||
                other.wikipedia == wikipedia) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.twitter, twitter) || other.twitter == twitter) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      missionName,
      missionId,
      const DeepCollectionEquality().hash(_manufacturers),
      const DeepCollectionEquality().hash(_payloadIds),
      wikipedia,
      website,
      twitter,
      description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MissionModelCopyWith<_$_MissionModel> get copyWith =>
      __$$_MissionModelCopyWithImpl<_$_MissionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MissionModelToJson(
      this,
    );
  }
}

abstract class _MissionModel implements MissionModel {
  const factory _MissionModel(
      {final String? missionName,
      final String? missionId,
      final List<String>? manufacturers,
      final List<String>? payloadIds,
      final String? wikipedia,
      final String? website,
      final String? twitter,
      final String? description}) = _$_MissionModel;

  factory _MissionModel.fromJson(Map<String, dynamic> json) =
      _$_MissionModel.fromJson;

  @override
  String? get missionName;
  @override
  String? get missionId;
  @override
  List<String>? get manufacturers;
  @override
  List<String>? get payloadIds;
  @override
  String? get wikipedia;
  @override
  String? get website;
  @override
  String? get twitter;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_MissionModelCopyWith<_$_MissionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
