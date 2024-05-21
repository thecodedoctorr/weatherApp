import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/models/weather_conditions.dart';


abstract class WeatherEvent extends Equatable {}



class WeatherDataLoaded extends WeatherEvent {
  final WeatherCondition? data;

  WeatherDataLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}



class WeatherDataLoading extends WeatherEvent {
  final bool? loading;

  WeatherDataLoading({required this.loading});

  @override
  List<Object?> get props => [loading];
}

class WeatherDataUnitChanged extends WeatherEvent{
  final bool? isInCelsius;

  WeatherDataUnitChanged({required this.isInCelsius});

  @override
  List<Object?> get props => [isInCelsius];
}

class CurrentCoordinatesDetermined extends WeatherEvent{
  final Position? currentCoordinates;

  CurrentCoordinatesDetermined({required this.currentCoordinates});

  @override
  List<Object?> get props => [currentCoordinates];
}

class IndexChanged extends WeatherEvent{
  final int index;
  IndexChanged({required this.index});

  @override
  List<Object?> get props => [index];

}