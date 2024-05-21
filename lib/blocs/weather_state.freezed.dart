// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeatherState {
  bool get loading => throw _privateConstructorUsedError;
  bool get failed => throw _privateConstructorUsedError;
  WeatherCondition? get weatherData => throw _privateConstructorUsedError;
  bool get isInCelsius => throw _privateConstructorUsedError;
  Position? get currentCoordinates => throw _privateConstructorUsedError;
  int get daysIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
  @useResult
  $Res call(
      {bool loading,
      bool failed,
      WeatherCondition? weatherData,
      bool isInCelsius,
      Position? currentCoordinates,
      int daysIndex});
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? failed = null,
    Object? weatherData = freezed,
    Object? isInCelsius = null,
    Object? currentCoordinates = freezed,
    Object? daysIndex = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      failed: null == failed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as bool,
      weatherData: freezed == weatherData
          ? _value.weatherData
          : weatherData // ignore: cast_nullable_to_non_nullable
              as WeatherCondition?,
      isInCelsius: null == isInCelsius
          ? _value.isInCelsius
          : isInCelsius // ignore: cast_nullable_to_non_nullable
              as bool,
      currentCoordinates: freezed == currentCoordinates
          ? _value.currentCoordinates
          : currentCoordinates // ignore: cast_nullable_to_non_nullable
              as Position?,
      daysIndex: null == daysIndex
          ? _value.daysIndex
          : daysIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherStateImplCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$WeatherStateImplCopyWith(
          _$WeatherStateImpl value, $Res Function(_$WeatherStateImpl) then) =
      __$$WeatherStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool failed,
      WeatherCondition? weatherData,
      bool isInCelsius,
      Position? currentCoordinates,
      int daysIndex});
}

/// @nodoc
class __$$WeatherStateImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$WeatherStateImpl>
    implements _$$WeatherStateImplCopyWith<$Res> {
  __$$WeatherStateImplCopyWithImpl(
      _$WeatherStateImpl _value, $Res Function(_$WeatherStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? failed = null,
    Object? weatherData = freezed,
    Object? isInCelsius = null,
    Object? currentCoordinates = freezed,
    Object? daysIndex = null,
  }) {
    return _then(_$WeatherStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      failed: null == failed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as bool,
      weatherData: freezed == weatherData
          ? _value.weatherData
          : weatherData // ignore: cast_nullable_to_non_nullable
              as WeatherCondition?,
      isInCelsius: null == isInCelsius
          ? _value.isInCelsius
          : isInCelsius // ignore: cast_nullable_to_non_nullable
              as bool,
      currentCoordinates: freezed == currentCoordinates
          ? _value.currentCoordinates
          : currentCoordinates // ignore: cast_nullable_to_non_nullable
              as Position?,
      daysIndex: null == daysIndex
          ? _value.daysIndex
          : daysIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WeatherStateImpl implements _WeatherState {
  const _$WeatherStateImpl(
      {this.loading = true,
      this.failed = false,
      this.weatherData = null,
      this.isInCelsius = false,
      this.currentCoordinates = null,
      this.daysIndex = 0});

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool failed;
  @override
  @JsonKey()
  final WeatherCondition? weatherData;
  @override
  @JsonKey()
  final bool isInCelsius;
  @override
  @JsonKey()
  final Position? currentCoordinates;
  @override
  @JsonKey()
  final int daysIndex;

  @override
  String toString() {
    return 'WeatherState(loading: $loading, failed: $failed, weatherData: $weatherData, isInCelsius: $isInCelsius, currentCoordinates: $currentCoordinates, daysIndex: $daysIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.failed, failed) || other.failed == failed) &&
            (identical(other.weatherData, weatherData) ||
                other.weatherData == weatherData) &&
            (identical(other.isInCelsius, isInCelsius) ||
                other.isInCelsius == isInCelsius) &&
            (identical(other.currentCoordinates, currentCoordinates) ||
                other.currentCoordinates == currentCoordinates) &&
            (identical(other.daysIndex, daysIndex) ||
                other.daysIndex == daysIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, failed, weatherData,
      isInCelsius, currentCoordinates, daysIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      __$$WeatherStateImplCopyWithImpl<_$WeatherStateImpl>(this, _$identity);
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState(
      {final bool loading,
      final bool failed,
      final WeatherCondition? weatherData,
      final bool isInCelsius,
      final Position? currentCoordinates,
      final int daysIndex}) = _$WeatherStateImpl;

  @override
  bool get loading;
  @override
  bool get failed;
  @override
  WeatherCondition? get weatherData;
  @override
  bool get isInCelsius;
  @override
  Position? get currentCoordinates;
  @override
  int get daysIndex;
  @override
  @JsonKey(ignore: true)
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
