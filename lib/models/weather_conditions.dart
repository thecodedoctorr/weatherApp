import 'dart:convert';
import 'dart:core';


class WeatherCondition {
  final String location;
  final List<double> temp;
  final List<double> humidity;
  final List<String> mainCondition;
  final List<double> pressure;

  WeatherCondition({
    required this.location,
    required this.mainCondition,
    required this.temp,
    required this.humidity,
    required this.pressure,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json)
  {
    List<double> allTemp = [
      json["list"][0]['main']['temp'].toDouble(),
      json["list"][1]['main']['temp'].toDouble(),
      json["list"][2]['main']['temp'].toDouble(),
      json["list"][3]['main']['temp'].toDouble()];

    //somehow the response comes back with 4 days forecast!

    List<double> allHumidities = [
      json["list"][0]['main']['humidity'].toDouble(),
      json["list"][1]['main']['humidity'].toDouble(),
      json["list"][2]['main']['humidity'].toDouble(),
      json["list"][3]['main']['humidity'].toDouble()];

    List<double> allPressure = [
      json["list"][0]['main']['pressure'].toDouble(),
      json["list"][1]['main']['pressure'].toDouble(),
      json["list"][2]['main']['pressure'].toDouble(),
      json["list"][3]['main']['pressure'].toDouble()];

    List<String> allMainConditions = [
      json["list"][0]["weather"][0]["main"].toString(),
      json["list"][1]["weather"][0]["main"].toString(),
      json["list"][2]["weather"][0]["main"].toString(),
      json["list"][3]["weather"][0]["main"].toString()
    ];

    return WeatherCondition(
      location: json["city"]["name"].toString(),
      temp: allTemp,
      mainCondition: allMainConditions,
      humidity: allHumidities,
      pressure: allPressure,
         );
  }
}
