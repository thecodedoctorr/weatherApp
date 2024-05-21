import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:ui';

import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/models/weather_conditions.dart';

part 'weather_state.freezed.dart';


@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(true) bool loading,
    //@Default(false) bool failed,  //properly  we could use this to treat cases of http call status != 200
    @Default(null) WeatherCondition? weatherData,
    @Default(false) bool isInCelsius, // to handle the change of unit
    @Default(null) Position? currentCoordinates,
    @Default(0) int daysIndex,

  }) = _WeatherState;
}
